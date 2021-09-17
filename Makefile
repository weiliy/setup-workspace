ADR_README  = doc/adr/README.md
OS 				 := $(shell uname -s)


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
ifeq ($(OS), Darwin)
	@echo Install Software
	cd mac && brew bundle
else
	@echo skip.
endif

install-tools: update-submodule install-tool-zsh install-tool-tmux

install-tool-%:
	@echo Config Tool $*
	make -C ./tools/$*

