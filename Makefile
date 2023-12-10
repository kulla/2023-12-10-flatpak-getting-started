default: help

build:
	flatpak-builder --force-clean build-dir org.flatpak.Hello.yml

help:
	@echo "Usage: make [command]"
	@echo ""
	@echo "Commands:"
	@echo ""
	@echo "build – Build the flatpak"
