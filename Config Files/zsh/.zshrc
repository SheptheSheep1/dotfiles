bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
#bindkey '^[OA' history-substring-search-up
#bindkey '^[OB' history-substring-search-down
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
#[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# powerlevel 10k theme
#source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# vi keybindings for history-substring-search
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
alias open="xdg-open"
eval "$(zoxide init zsh)"
source /usr/share/nvm/init-nvm.sh
export GEMINI_API_KEY="POOP"

autoload -U compinit
compinit

HISTFILE=~/.zsh_history
HISTSIZE=5000

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

eval "$(starship init zsh)"
