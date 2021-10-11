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


ifeq ($(OS), Darwin)
install: install-mac install-tools
else
install: install-linux install-tools
endif

install-linux:
	@echo Install Software for $(OS)
	cd linux && ./install.sh

install-mac:
	@echo Install Software
	cd mac && brew bundle

install-tools: update-submodule install-tool-zsh install-tool-tmux

install-tool-%:
	@echo Config Tool $*
	make -C ./tools/$*

