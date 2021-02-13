#!/bin/bash

set -euo pipefail

#### Vim ####

rm -rf "${HOME}/.vim"
rm -f "${HOME}/.vimrc"

vim_dotfiles_dir=$(cd "$(dirname "$0")"; pwd)
mkdir "${HOME}/.vim"
ln -s "${vim_dotfiles_dir}/vim/vimrc" "${HOME}/.vimrc"
ln -s "${vim_dotfiles_dir}/vim/vimrc.bundles" "${HOME}/.vim/vimrc.bundles"
ln -s "${vim_dotfiles_dir}/vim/ruby_mappings.vim" "${HOME}/.vim/ruby_mappings.vim"
ln -s "${vim_dotfiles_dir}/vim/colors/" "${HOME}/.vim/colors"

# Install vim-plug
curl -sfLo "${HOME}/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

vim +PlugInstall +PlugClean! +qall
