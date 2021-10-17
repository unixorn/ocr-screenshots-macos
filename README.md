# ocr-screenshots-macos

OCR all screenshots on macOS

Based on Alexandru Nedelcu's [Organize and Index Your Screenshots (OCR) on macOS](https://alexn.org/blog/2020/11/11/organize-index-screenshots-ocr-macos.html) blog post. `screenshots-sync` is his, the LICENSE only applies to the Makefile.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [ocr-screenshots-macos](#ocr-screenshots-macos)
  - [Install Instructions](#install-instructions)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Status
[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Funixorn%2Focr-screenshots-macos%2Fbadge&style=plastic)](https://actions-badge.atrox.dev/unixorn/ocr-screenshots-macos/goto)

## Install Instructions

1. Checkout this repository
2. `make ocr-screenshots`

## Details

When you run `make ocr-screenshots`, `make` will:

1. Create `~/bin`, `~/Dropbox/Screenshots/OCR`, `~/Dropbox/Screenshots/Processing` and `~/Dropbox/Screenshots/Raw` if they don't exist
2. Install tesseract with `brew`
3. Copy `screenshots-sync` to `~/bin`
4. Create a `sync.ocr.plist` file that's aware of your specific directory paths
5. Install the plist.

Per the original [post](https://alexn.org/blog/2020/11/11/organize-index-screenshots-ocr-macos.html), new screen shots will then automatically get written to `~/Dropbox/Screenshots/Processing` and macOS will trigger an OCR run with `screenshots-sync` - processed PDFs with text annotations will be written to `~/Dropbox/Screenshots/OCR`, and the originals will be moved to `~/Dropbox/Screenshots/Raw`.