#!/bin/bash

set -euo pipefail

dotfiles_dir=$(cd "$(dirname "$0")"; pwd)

#### vim ####

rm -rf "${HOME}/.vim"
rm -f "${HOME}/.vimrc"

mkdir "${HOME}/.vim"
ln -s "${dotfiles_dir}/vim/vimrc" "${HOME}/.vimrc"
ln -s "${dotfiles_dir}/vim/vimrc.bundles" "${HOME}/.vim/vimrc.bundles"
ln -s "${dotfiles_dir}/vim/ruby_mappings.vim" "${HOME}/.vim/ruby_mappings.vim"
ln -s "${dotfiles_dir}/vim/colors/" "${HOME}/.vim/colors"

# Install vim-plug
curl -sfLo "${HOME}/.vim/autoload/plug.vim" --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

vim +PlugInstall +PlugClean! +qall

#### tmux ####

rm -f "${HOME}/.tmux.conf"
ln -s "${dotfiles_dir}/tmux/tmux.conf" "${HOME}/.tmux.conf"

rm -f "${HOME}/.tmate.conf"
ln -s "${dotfiles_dir}/tmux/tmate.conf" "${HOME}/.tmate.conf"

#### zsh ####

rm -f "${HOME}/.zshrc"
ln -s "${dotfiles_dir}/zsh/zshrc" "${HOME}/.zshrc"
