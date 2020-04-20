### stfu new mac warning about zsh
export BASH_SILENCE_DEPRECATION_WARNING=1

source ~/dotfiles/.bash_aliases
source ~/.credentials
source ~/.languages
source ~/utils/kube.sh
source ~/utils/ghub.sh

source ~/.iterm2_shell_integration.bash

source /usr/local/etc/bash_completion

source ~/.git-prompt.sh
source ~/.git-completion.sh


# for f in ~/utils/*; do source ${f}; done

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

export __LS_OPTIONS='--color=auto -h'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacadexport CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
### End PS1

### Replace less
if [ -x "`which most 2>&1`" ]; then
    alias less=most
    export PAGER=most
fi

### Set default editor to vim
if [ -x "`which vim 2>&1`" ]; then

# Print tasks to screen
        export EDITOR=vim
fi

function allcolors() {
    # credit to http://askubuntu.com/a/279014
    for x in 0 1 4 5 7 8; do
        for i in `seq 30 37`; do
            for a in `seq 40 47`; do
                echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
            done
            echo
        done
    done
    echo ""
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

. /usr/local/opt/asdf/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
