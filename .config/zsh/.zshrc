#   ___________ _   _______  _____ 
#  |___  /  ___| | | | ___ \/  __ \
#     / /\ `--.| |_| | |_/ /| /  \/
#    / /  `--. \  _  |    / | |    
#  ./ /__/\__/ / | | | |\ \ | \__/\
#  \_____|____/\_| |_|_| \_| \____/
#                                  

# Enable colors and change prompt and some other settings:
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
setopt autocd		# Automatically cd into typed directory.
stty stop undef		# Disable ctrl-s to freeze terminal.
setopt interactive_comments

# History in cache directory:
HISTSIZE=10000000
SAVEHIST=10000000
setopt incappendhistory
setopt append_history 
setopt share_history 

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)       # Include hidden files.
setopt globdots

# Case Insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

set -o emacs
export KEYTIMEOUT=1
bindkey -M menuselect '^[[Z' reverse-menu-complete #<S-Tab> for reverse menu

autoload -U select-word-style
select-word-style bash

# Load
# [ -f "$HOME/.config/shell/shortcutrc" ] && source "$HOME/.config/shell/shortcutrc"
# [ -f "$HOME/.config/shell/vim_bindrc" ] && source "$HOME/.config/shell/vim_bindrc"
source "$HOME/.config/shell/aliasrc"

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
