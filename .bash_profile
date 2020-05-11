### stfu new mac warning about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/dotfiles/.bash_aliases
source ~/dotfiles/utils/general.sh
source ~/dotfiles/utils/kube.sh
source ~/dotfiles/utils/ghub.sh
source ~/dotfiles/.languages.sh
source ~/.credentials

source ~/.iterm2_shell_integration.bash

source /usr/local/etc/bash_completion

source ~/.git-prompt.sh
source ~/.git-completion.sh

### PS1
export PS1="________________________________________________________________________________\n| [\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]=>\[\033[32m\]$ \[\
\033[0m\]"

export __LS_OPTIONS='--color=auto -h'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacadexport CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
### End PS1
