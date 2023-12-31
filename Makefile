.PHONY: build help install repo run

MANIFEST=org.flatpak.Hello.yml
BUILD_DIR=build-dir
REPO=repo
PWD=$(shell pwd)

default: help

output.txt:
	touch $@

build:
	flatpak-builder --force-clean $(BUILD_DIR) $(MANIFEST)

help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "build   – Build the flatpak"
	@echo "install – Install the flatpak"
	@echo "repo    – Add the flatpak to the repo `repo`"
	@echo "run     – Run the installed flatpak"

install:
	flatpak-builder --user --install --force-clean $(BUILD_DIR) $(MANIFEST)

repo:
	flatpak-builder --repo=$(REPO) --force-clean $(BUILD_DIR) $(MANIFEST)

run: install output.txt
	flatpak run --filesystem=$(PWD)/input.txt:ro \
		--filesystem=$(PWD)/output.txt \
		org.flatpak.Hello input.txt
