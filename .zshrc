FPATH="$(brew --prefix)/share/zsh/site-functions/:${FPATH}"
source $(brew --prefix)/share/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen apply

# Starship prompt
eval "$(starship init zsh)"

alias vim="nvim"
alias ls="ls --color"
alias ll="ls -lh"
alias la="ls -a"
