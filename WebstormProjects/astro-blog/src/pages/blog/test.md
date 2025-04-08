---
layout: ../../layouts/MarkdownLayout.astro
title: "Comprehensive Markdown Test Post"
author: "Vlad"
date: "2025-04-08"
description: "This post showcases a variety of Markdown styling features for testing."
tags:
  - markdown
  - testing
  - blog
---

# Comprehensive Markdown Test Post

This is a comprehensive test post to demonstrate **all common styling options** in Markdown. Use this post for testing layout, design, and rendering in your Astro project.

## Table of Contents
- [Comprehensive Markdown Test Post](#comprehensive-markdown-test-post)
  - [Table of Contents](#table-of-contents)
  - [Headers](#headers)
- [Header 1](#header-1)
  - [Header 2](#header-2)
    - [Header 3](#header-3)
      - [Header 4](#header-4)
        - [Header 5](#header-5)
          - [Header 6](#header-6)
  - [Paragraphs and Line Breaks](#paragraphs-and-line-breaks)
  - [Emphasis](#emphasis)
  - [Lists](#lists)
    - [Unordered Lists](#unordered-lists)
    - [Ordered Lists](#ordered-lists)
    - [Task Lists](#task-lists)
  - [Links \& Images](#links--images)
  - [Blockquotes](#blockquotes)
  - [Code Blocks](#code-blocks)
    - [Inline Code](#inline-code)
    - [Fenced Code Blocks](#fenced-code-blocks)

## Headers

Markdown supports six levels of headers:

# Header 1  
## Header 2  
### Header 3  
#### Header 4  
##### Header 5  
###### Header 6  

## Paragraphs and Line Breaks

Regular paragraphs have a clear, easy-to-read style.  
You can insert a line break by ending a line with two spaces.

This is the next paragraph.

## Emphasis

You have several ways to style your text:

- *Italic* text using asterisks or underscores.
- **Bold** text to emphasize stronger.
- ***Bold and italic*** for combined emphasis.
- ~~Strikethrough~~ to indicate removed or outdated information.

## Lists

### Unordered Lists

- Item one
- Item two
  - Nested item under item two
    - Even deeper nested item
- Item three

### Ordered Lists

1. First item
2. Second item
   1. Sub-item one
   2. Sub-item two
3. Third item

### Task Lists

- [x] Completed task
- [ ] Incomplete task
- [ ] Another pending task

## Links & Images

You can easily add links and images:

- [Visit Astro Documentation](https://docs.astro.build/)
- [Visit GitHub](https://github.com/)

Here’s an inline image example:

![Astro Logo](https://astro.build/assets/astro-logo.svg)

## Blockquotes

> This is a blockquote.  
> It can span multiple lines, making it great for highlighting quotes or key information.
>
> Use blockquotes for references or to emphasize a section.

## Code Blocks

### Inline Code

Use inline code like `let x = 10;` within a sentence.

### Fenced Code Blocks

Below is an example in JavaScript:

```javascript
// JavaScript example
function greet(name) {
  return `Hello, ${name}!`;
}
console.log(greet("World"));
