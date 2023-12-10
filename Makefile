default: help

build:
	flatpak-builder --force-clean build-dir org.flatpak.Hello.yml

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
	flatpak-builder --user --install --force-clean build-dir org.flatpak.Hello.yml

repo:
	flatpak-builder --repo=repo --force-clean build-dir org.flatpak.Hello.yml

run: install
	flatpak run org.flatpak.Hello passed-arg-foo
