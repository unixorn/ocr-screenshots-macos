# Copyright 2021 Joe Block <jpb@unixorn.net>
# License: Apache 2.0

help:
	@echo "run 'make ocr-screenshots' to set up OCR for all new screen shots"

ocr: ocr-screenshots
ocr-screenshots: deps install-launchd

deps: dirs update-screenshot-location install-tesseract

plist:
	sed "s/USERNAME/${USER}/g" < sync.ocr.plist-template > sync.ocr.plist

install-launchd: dirs install-script plist
	cp sync.ocr.plist ~/Library/LaunchAgents
	launchctl load -w ~/Library/LaunchAgents/sync.ocr.plist

install-script: dirs
	cp screenshots-sync ~/bin

dirs:
	mkdir -p ~/Dropbox/Screenshots/Processing
	mkdir -p ~/Dropbox/Screenshots/OCR
	mkdir -p ~/Dropbox/Screenshots/Raw
	mkdir -p ~/bin
	mkdir -p ~/Library/LaunchAgents

install-tesseract:
	brew install tesseract

update-screenshot-location: dirs
	defaults write com.apple.screencapture location ~/Dropbox/Screenshots/Processing
