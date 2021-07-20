ADR_README = doc/adr/README.md

all: update-submodule install
doc: adr

.phony: adr
adr:
	@echo Update ADR readme
	@echo generate toc
	adr generate toc > $(ADR_README)

update-submodule:
	git submodule update --init --recursive

upgrade-submodule:
	git submodule update --remote --merge

install: install-mac install-tools

install-mac:
	@echo Install Software
	cd mac && brew bundle

install-tools: update-submodule install-tool-zsh install-tool-tmux

install-tool-%:
	@echo Config Tool $*
	make -C ./tools/$*

	
