# ocr-screenshots-macos

OCR all screenshots on macOS

## Status

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
![Superlinter](https://github.com/unixorn/ocr-screenshots-macos/actions/workflows/superlinter.yml/badge.svg)


Alexandru Nedelcu wrote a blog post, [Organize and Index Your Screenshots (OCR) on macOS](https://alexn.org/blog/2020/11/11/organize-index-screenshots-ocr-macos.html), showing how to set up automatic OCR for your screen shots.

This repo automates the setup steps detailed in their article so that all you have to do is install [homebrew](https://brew.sh) and then run `make ocr`.

They wrote `screenshots-sync` and did all the hard work, the LICENSE only applies to the `Makefile`.

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Table of Contents

- [Install Instructions](#install-instructions)
- [Details](#details)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

## Install Instructions

You must have [homebrew](https://brew.sh) installed to use this `Makefile`.

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