### Begin hstr
### Amazing utility, one of my favorites
### https://github.com/dvorka/hstr
export HH_CONFIG=hicolor         # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
### End hstr

### PS1 
export PS1="________________________________________________________________________________\n| [\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]=>\[\033[32m\]$ \[\
\033[0m\]"
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacadexport CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
### End PS1