# Modules

autoload -U compinit promptinit colors
compinit
promptinit
colors

# History file

export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE=$HOME/.histfile

setopt HIST_IGNORE_DUPS

# Key bindings

bindkey '^R' history-incremental-search-backward

# Prompt

setopt prompt_subst

function host {
  if [ $SSH_CLIENT ]
  then
    echo "%{$fg[yellow]%}%B%M (remote)%b%{$reset_color%}"
  else
    echo "%{$fg[cyan]%}%B%M%b%{$reset_color%}"
  fi
}

function u_color {
  if [ $USER = "root" ]
  then
    echo "%{$fg[red]%}%B%n%b%{$reset_color%}"
  else
    echo "%{$fg[green]%}%B%n%b%{$reset_color%}"
  fi
}

function git_branch {
  branch="$(git symbolic-ref --short HEAD 2> /dev/null)"
  if [ $branch ]
  then
    echo "%{$fg[blue]%}($branch)%{$reset_color%}"
  fi
}

function ret_code {
  if [ $? != 0 ]
  then
    echo "%{$fg[red]%}%B%?%b%{$reset_color%}"
  else
    echo "%B%?%b"
  fi
}

export PROMPT="┌[$(host)]-[$(u_color):%~]"'$(git_branch)'"
└─────╸ "
export RPROMPT='$(ret_code)'" ╺┘"

# Plugins

. /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Environment variables

[ -f $HOME/.envrc ] && [ "$ENV_USER" != "$USER" ] && . $HOME/.envrc

# Aliases and functions

[ -f $HOME/.aliases ] && . $HOME/.aliases
[ -f $HOME/.aliases.local ] && . $HOME/.aliases.local
[ -d $HOME/.functions ] && for i in $HOME/.functions/*.sh; do . $i; done
