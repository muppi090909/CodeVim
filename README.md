# CodeVim <br>
A [NeoVim](https://github.com/neovim/neovim) config made for programming <br>
 <br>
Dependencies:  <br>
    1. [fzf](https://github.com/junegunn/fzf) <br>
    2. NeoVim 0.5+ <br>
    3. [nnn](https://github.com/jarun/nnn) <br>
    4. [pipenv](https://github.com/pypa/pipenv) *optional: only needed for python env management* <br>
 <br>
Install instuctions:  <br>
    Note: This is only for Linux but maybe MacOS *if you have a mac please open <br>
    an issue for opting to be a tester* <br>
    Step 1 <br>
        Install dependencies <br>
    Step 2 <br>
        clone the repo  <br>
        ```sh <br>
        git clone https://github.com/muppi090909/CodeVim.git -C ~/.config/ && mv ~/.config/CodeVim ~/.config/nvim --recursive
        ``` <br>
        *NOTE: this will rename the folder to nvim and wipe out all the <br>
        previous nvim data* <br>
    Step 3  <br>
        Install [vim-plug](https://github.com/junegunn/vim-plug) <br>
        generally this command if you did a normal install but if you used any <br>
        other installation method please refer to the vim-plug README. <br>
        ```sh <br>
        sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
        ``` <br>
    Step 4 <br>
        open neovim *ignore the many errors. You can press q to clear all*. <br>
        and do :PlugInstall *dont copy paste this just type*. <br>
        and your done. Feel free to open any issues if you need help.  <br>
