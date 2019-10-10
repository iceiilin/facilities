* vim configuration steps

0. git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
1. cp .vimrc $HOME/.
2. cp colors $HOME/.vim/.
3. use :PluginInstall to install plugins in vim

if go plugin requires vim version > 8.0, update vim:
1. sudo add-apt-repository ppa:jonathonf/vim
2. sudo apt update
3. sudo apt install vim
