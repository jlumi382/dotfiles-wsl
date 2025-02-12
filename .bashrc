# exit if not an interactive shell
case $- in
*i*) ;;
*) return ;;
esac

# aliases
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# enable completions
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# shell options
shopt -s checkwinsize
shopt -s histappend
bind "set completion-ignore-case on"

# plugins
eval "$(zoxide init bash)"
