#!/bin/sh

ESC=$(printf '\033')
YELLOW="${ESC}[33m"
GREEN="${ESC}[32m"
NC="${ESC}[0m"

command -v git >/dev/null 2>&1 || echo "${YELLOW}git is not installed. Skipping...$NC" && exit 0

[ ! -d "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim" ] && \
	echo "${GREEN}Installing packer...$NC" && \
	( git clone -q --depth 1 https://github.com/wbthomason/packer.nvim "$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"  && \
	# installing all plugins automatically when packer get installed (if nvim is available)
	command -v nvim >/dev/null 2>&1 && (nvim --headless +"autocmd User PackerComplete quitall" +PackerInstall > /dev/null 2>&1) )
