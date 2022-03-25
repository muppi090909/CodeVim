# CodeVim
A [NeoVim](https://github.com/neovim/neovim) config made for programming

Dependencies: 
    1. [fzf](https://github.com/junegunn/fzf)
    2. NeoVim 0.5+
    3. [nnn](https://github.com/jarun/nnn)
    4. [pipenv](https://github.com/pypa/pipenv) *optional: only needed for python env management*

Install instuctions: 
    Note: This is only for Linux but maybe MacOS *if you have a mac please open
    an issue for opting to be a tester*
    Step 1
        Install dependencies
    Step 2
        clone the repo 
        ```sh
        git clone https://github.com/muppi090909/CodeVim.git -C ~/.config/ && mv ~/.config/CodeVim ~/.config/nvim
        ```
        *NOTE: this will rename the folder to nvim and wipe out all the
        previous nvim data*
    Step 3 
        Install [vim-plug](https://github.com/junegunn/vim-plug)
        generally this command if you did a normal install but if you used any
        other installation method please refer to the vim-plug README.
        ```sh
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        ```
    Step 4
        open neovim *ignore the many errors. You can press q to clear all*.
        and do :PlugInstall *dont copy paste this just type*.
        and your done. Feel free to open any issues if you need help. 
