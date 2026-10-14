return {

  {
    "nvimdev/dashboard-nvim",
    lazy = false, -- As https://github.com/nvimdev/dashboard-nvim/pull/450, dashboard-nvim shouldn't be lazy-loaded to properly handle stdin.
    opts = function()
      local logo = [[
⢰⡟⣡⡟⣱⣿⡿⠡⢛⣋⣥⣴⣌⢿⣿⣿⣿⣿⣷⣌⠻⢿⣿⣿⣿⣿⣿⣿
⠏⢼⡿⣰⡿⠿⠡⠿⠿⢯⣉⠿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣦⣍⠻⢿⣿⣿⣿
⣼⣷⢠⠀⠀⢠⣴⡖⠀⠀⠈⠻⣿⡿⣿⣿⣿⣿⣿⣛⣯⣝⣻⣿⣶⣿⣿⣿
⣿⡇⣿⡷⠂⠈⡉⠀⠀⠀⣠⣴⣾⣿⣿⣿⣿⣿⣍⡤⣤⣤⣤⡀⠀⠉⠛⠿
⣿⢸⣿⡅⣠⣬⣥⣤⣴⣴⣿⣿⢿⣿⣿⣿⣿⣿⣟⡭⡄⣀⣉⡀⠀⠀⠀⠀
⡟⣿⣿⢰⣿⣿⣿⣿⣿⣿⣿⣿⣾⣿⣿⣿⣿⣿⣿⣿⣶⣦⣈⠀⠀⠀⢀⣶
⡧⣿⡇⣼⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣶⣾⣿
⡇⣿⠃⣿⣿⣿⣿⣿⠛⠛⢫⣿⣿⣻⣻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿
⡇⣿⠘⡇⢻⣿⣿⣿⡆⠀⠀⠀⠀⠈⠉⠙⠻⠏⠛⠻⣿⣿⣿⣿⣿⣭⡾⢁
⡇⣿⠀⠘⢿⣿⣿⣿⣧⢠⣤⠀⡤⢀⣠⣀⣀⠀⠀⣼⣿⣿⣿⣿⣿⠟⣁⠉
⣧⢻⠀⡄⠀⠹⣿⣿⣿⡸⣿⣾⡆⣿⣿⣿⠿⣡⣾⣿⣿⣿⣿⡿⠋⠐⢡⣶
⣿⡘⠈⣷⠀⠀⠈⠻⣿⣷⣎⠐⠿⢟⣋⣤⣾⣿⣿⣿⡿⠟⣩⠖⢠⡬⠈⠀
⣿⣧⠁⢻⡇⠀⠀⠀⠈⠻⣿⣿⣿⣿⣿⣿⠿⠟⠋⠁⢀⠈⢀⡴⠈⠁⠀⠀
⠻⣿⣆⠘⣿⠀⠀  ⠀⠈⠙⠛⠋⠉⠀⠀⠀⠀⡀⠤⠚⠁     
    ]]

      -- breathing room between the block and the screen edges, in rows
      local top_margin, bottom_margin = 2, 2

      -- picture + buttons + footer as a single block, centered vertically
      -- doom renders two rows per entry (the entry plus a blank one), the footer takes one row
      local function build_header(buttons_count)
        local art = vim.split(logo, "\n")
        -- drop the empty rows the long string literal adds, they are invisible but skew the centering
        while art[1]:match("^%s*$") do
          table.remove(art, 1)
        end
        while art[#art]:match("^%s*$") do
          table.remove(art)
        end
        local sep = 1 -- blank row between the picture and the buttons
        local height = vim.api.nvim_win_get_height(0)
        local block = #art + sep + 2 * buttons_count + 1
        local free = math.max(0, height - block - top_margin - bottom_margin)
        local pad_top = math.floor(free / 2)
        -- the footer is rendered last, so it fills the bottom half of the free space itself
        -- (a global, dashboard dumps the footer to json and restores it without upvalues)
        vim.g.dashboard_padding = bottom_margin + free - pad_top
        local header = {}
        for _ = 1, top_margin + pad_top do
          header[#header + 1] = ""
        end
        vim.list_extend(header, art)
        for _ = 1, sep do
          header[#header + 1] = ""
        end
        return header
      end

      local opts = {
        theme = "doom",
        hide = {
          -- this is taken care of by lualine
          -- enabling this messes up the actual laststatus setting after loading a file
          statusline = false,
        },
        config = {
          header = {}, -- built below, when the amount of buttons is known
        -- stylua: ignore
        center = {
          { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
          { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
          { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
          { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
          { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
          { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
          { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
          { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
          { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
        },
          -- note: no upvalues here, dashboard dumps the footer to json and restores it without them
          footer = function()
            local stats = require("lazy").stats()
            local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
            local lines = { "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms" }
            -- pad the bottom of the block so that the whole block sits in the middle of the window
            for _ = 1, vim.g.dashboard_padding or 0 do
              lines[#lines + 1] = ""
            end
            return lines
          end,
        },
      }

      for _, button in ipairs(opts.config.center) do
        button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
        button.key_format = "  %s"
      end

      opts.config.header = build_header(#opts.config.center)

      -- dashboard freezes its config at render time, so on resize we rebuild the header and re-render in place
      local function rerender()
        local config = vim.tbl_extend("force", opts.config, {
          bufnr = vim.api.nvim_get_current_buf(),
          winid = vim.api.nvim_get_current_win(),
        })
        config.header = build_header(#config.center)
        require("dashboard.theme." .. opts.theme)(config)
      end

      local layout_group = vim.api.nvim_create_augroup("DashboardLayout", { clear = true })

      -- drop the plugin's own VimResized handler, it would re-render with the frozen config
      vim.api.nvim_create_autocmd("User", {
        group = layout_group,
        pattern = "DashboardLoaded",
        callback = function()
          vim.api.nvim_clear_autocmds({ event = "VimResized", buffer = vim.api.nvim_get_current_buf() })
        end,
      })

      vim.api.nvim_create_autocmd("VimResized", {
        group = layout_group,
        callback = function()
          if vim.bo.filetype ~= "dashboard" then
            return
          end
          vim.schedule(rerender) -- the window is not resized yet while the event is running
        end,
      })

      -- open dashboard after closing lazy
      if vim.o.filetype == "lazy" then
        vim.api.nvim_create_autocmd("WinClosed", {
          pattern = tostring(vim.api.nvim_get_current_win()),
          once = true,
          callback = function()
            vim.schedule(function()
              vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
            end)
          end,
        })
      end

      return opts
    end,
  },
}
