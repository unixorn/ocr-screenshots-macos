help:
	@echo "make ocr-screenshots to set up OCR for all new screen shots"

ocr: ocr-screenshots
ocr-screenshots: deps install-launchd

plist:
	sed "s/USERNAME/${USER}/g" < sync.ocr.plist-template > sync.ocr.plist

install-launchd: dirs install-script plist
	cp sync.ocr.plist ~/Library/LaunchAgents
	launchctl load -w ~/Library/LaunchAgents/sync.ocr.plist

install-script: dirs
	cp screenshots-sync ~/bin

deps: dirs update-screnshot-location install-tesseract

dirs:
	mkdir -p ~/Dropbox/Screenshots/Processing
	mkdir -p ~/Dropbox/Screenshots/OCR
	mkdir -p ~/Dropbox/Screenshots/Raw
	mkdir ~/bin
	mkdir -p ~/Library/LaunchAgents

install-tesseract:
	brew install tesseract

update-screenshot-location:
	defaults write com.apple.screencapture location ~/Dropbox/Screenshots/Processing
