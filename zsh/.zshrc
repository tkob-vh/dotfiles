# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples




export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE


setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY


export WORDCHARS="${WORDCHARS//\/}"



export MANROFFOPT="-c"
export MANPAGER="sh -c 'col -bx | bat -l man -p'"


export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"
export FZF_CTRL_T_OPTS="
--walker-skip .git,node_modules,target
--preview 'bat -n --color=always {}'
--bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="
--preview 'echo {}' --preview-window up:3:hidden:wrap
--bind 'ctrl-/:toggle-preview'
--bind 'ctrl-y:execute-silent(echo -n {2..} | wl-copy)+abort'
--color header:italic
--header 'Press CTRL-Y to copy command into clipboard using wl-copy'"
export FZF_ALT_C_OPTS="
--walker-skip .git,node_modules,target
--preview 'tree -C {}'"

export FZF_BASE=$HOME/.nix-profile/bin/fzf

# Preferred editor for local and remote sessions
bindkey -e
export EDITOR='nvim'



# Compilation flags
export ARCHFLAGS="-arch x86_64"



# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


alias l='lsd -F'
alias ls='lsd -F'
alias la='lsd -AF'
alias ll='lsd -alF'

alias ~='cd ~'
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias vi='nvim'
alias _vi='sudoedit'
alias leet='vi leetcode.nvim'
alias weather='curl wttr.in/wuhan'
alias post="curl -F \"c=@-\" \"http://fars.ee/\""
alias path='echo -e ${PATH//:/\\n}'
# alias fzf='fzf --preview "bat --color=always --style=header,grid --line-range=:50 {}"'
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias info="pinfo"
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias ip='ip -color=auto'



# Some functions
mkd() { mkdir -p "$@" && cd "$@"; }
-() { cd -; }
batdiff() {
    git diff --name-only --relative --diff-filter=d | xargs bat --diff
}
_fzf_comprun(){
    local command=$1
    shift
    case "$command" in
        cd)             fzf --preview 'tree -C {} | head -200'      "$@" ;;
        export|unset)   fzf --preview "eval 'echo \$'{}"            "$@" ;;
        ssh)            fzf --preview 'dig {}'                      "$@" ;;
        *)              fzf --preview 'bat -n --color=always {}'    "$@" ;;
    esac
}


#eval $(thefuck --alias)
eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)


# Hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
fi


## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /home/charswool/.dart-cli-completion/zsh-config.zsh ]] && . /home/charswool/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]

