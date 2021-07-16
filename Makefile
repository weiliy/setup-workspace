ADR_README = doc/adr/README.md

all: adr

.phony: adr
adr:
	@echo Update ADR readme
	@echo generate toc
	adr generate toc > $(ADR_README)


install: install-mac

install-mac:
	cd mac && brew bundle
	
