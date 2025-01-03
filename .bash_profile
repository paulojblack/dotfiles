### stfu new mac warning about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/dotfiles/utils/general.sh
source ~/dotfiles/.bash_aliases
source ~/dotfiles/utils/ghub.sh
source ~/dotfiles/.languages.sh
source ~/.credentials
source ~/.iterm2_shell_integration.bash

source ~/dotfiles/.imagine

source ~/dotfiles/utils/kube_completion

### PS1
export PS1="________________________________________________________________________________\n| [\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]=>\[\033[32m\]$ \[\
\033[0m\]"

export __LS_OPTIONS='--color=auto -h'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacadexport CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
### End PS1

# Prevent overwriting files with cat
set -o noclobber

# Don't log out with ctrl-d
set -o ignoreeof

export PATH="/opt/homebrew/Cellar/postgresql@15/15.2_3/bin/psql:$PATH"
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@15/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@15/include"

### pyenv setup needs to be last thing executed (I think) because it doesnt work unless its to the left of all other python related
### binaries in the $PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi



eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mcfly init bash)"


complete -C /opt/homebrew/bin/terraform terraform

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
