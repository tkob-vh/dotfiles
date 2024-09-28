# ~/.zshrc file for zsh interactive shells.
# see /usr/share/doc/zsh/examples/zshrc for examples




export HISTFILE=$HOME/.zsh_history
export HISTFILESIZE=1000000000
export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE


setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Modify word seperator.
export WORDCHARS="${WORDCHARS//\/}"

autoload -Uz +X compinit && compinit

## case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' menu select

fpath=(~/.zsh $fpath)
source $HOME/.zsh/alias.zsh

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
autoload edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line


# Compilation flags
export ARCHFLAGS="-arch x86_64"


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

topcmds() {
    history | \
        awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | \
        grep -v "./" | \
        column -c3 -s " " -t | \
        sort -nr | nl |  head -n 20
}

function sterile() {
    history | awk '$2 != "history" { $1=""; print $0 }' | egrep -vi "\
        curl\b+.*(-E|--cert)\b+.*\b*|\
        curl\b+.*--pass\b+.*\b*|\
        curl\b+.*(-U|--proxy-user).*:.*\b*|\
        curl\b+.*(-u|--user).*:.*\b*
            .*(-H|--header).*(token|auth.*)\b+.*|\
                wget\b+.*--.*password\b+.*\b*|\
                http.?://.+:.+@.*\
                " > $HOME/histbuff; history -r $HOME/histbuff;

}

export PROMPT_COMMAND="sterile"

eval "$(starship init zsh)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

# miniconda
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1

# Hyprland
if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    exec Hyprland
fi


