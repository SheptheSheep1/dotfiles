bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#bindkey '^[OA' history-substring-search-up
#bindkey '^[OB' history-substring-search-down

# vi keybindings for history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# aliases
alias open="xdg-open"
alias ls="ls --color=auto"
alias grep="grep --color=auto"

eval "$(zoxide init zsh)"
export GEMINI_API_KEY="POOP"

autoload -U compinit
compinit

# history
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY        # Add to end
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt SHARE_HISTORY             # Share history between all sessions.

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

#PS1='%F{blue}%~ %(?.%F{green}.%F{red})%#%f '
PS1='%(?.%F{green}√.%F{red}?%?)%f %B%F{240}%1~%f%b %# '
