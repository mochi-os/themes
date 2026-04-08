# Makefile for Mochi apps
# Copyright Alistair Cunningham 2025-2026

APP = $(notdir $(CURDIR))
VERSION = $(shell grep -m1 '"version"' app.json | sed 's/.*"version"[[:space:]]*:[[:space:]]*"\([^"]*\)".*/\1/')
RELEASE = ../../release

all:

clean:

release:
	rm -f $(RELEASE)/$(APP)_*.zip
	zip -r $(RELEASE)/$(APP)_$(VERSION).zip app.json backgrounds icons labels
	git tag -a $(VERSION) -m "$(VERSION)" 2>/dev/null || true

deploy:

commit:
	git add -A && git commit -m "$(VERSION)" || true

push:
	git push --follow-tags

everything: clean release deploy commit push
