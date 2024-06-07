# dotfiles
My dotfiles which use [chezmoi](https://www.chezmoi.io) to manage.

## zsh
I use [starship](https://starship.rs) as my zsh prompt.

### The plugins I use
* I use **zsh-syntax-highlighting** and **bat**(which can be used to colorize the manpage, the '--help' output and so on) to colorize the terminal output.
* I use **zsh-autosuggestions** for zsh completions.
* I use **fzf**(use the latest version if you encounterd some errors) to speed up my work. 
    * Use **<C-t>** to run $FZF_CTRL_T_COMMAND and get a list of files and directories.
    * Use **<C-r>** to run $FZF_CTRL_R_COMMAND and view the zsh histories.
    * Use **<ALT-C>** to run $FZF_ALT_C_COMMAND and get a list of directories.
    * Use `cd/export/unset/ssh **<tab>` to preview the possible candidate.
    * All above options provide real-time preview for directories/files, and have a dependency on `bat`.
    * You may need to change the FZF_BASE environment variable in the zshrc according to your needs.


### some useful & interesting functions/alias

`alias weather='curl wttr.in/wuhan` # show weather in Wuhan

`mkd() {mkdir -p "$@" && cd "$@"; } ` # make dir and cd into it

`alias path='echo -e ${PATH//:/\\n}'` # get all the path in the PATH environment variable


## vim
as simple ass possible

## neovim
I use **packer** to manage the plugins.


### Theme
I use **catppuccin** as the theme.

### LSP & completion


### markdown-preview


### github-copilot

### Leetcode

### other functions






