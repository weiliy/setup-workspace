#!/bin/bash

install_node() {
	# https://github.com/nodesource/distributions/blob/master/README.md
	# Using Ubuntu
	curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
	sudo apt-get install -y nodejs
}

command -v node || install_node
