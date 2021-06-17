### Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

### Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### ASDF
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash

## autonvm switching
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD
  [[ -f ".nvmrc" ]] && nvm use
}
## Pretty sure this is fine because it's the first usage of it
export PROMPT_COMMAND=enter_directory

### Begin hstr
### Amazing utility, one of my favorites
### https://github.com/dvorka/hstr
# export HH_CONFIG=hicolor         # get more colors
# shopt -s histappend              # append new history items to .bash_history
# export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"   # mem/file sync
# # if this is interactive shell, then bind hh to Ctrl-r (for Vi mode check doc)
# if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hh -- \C-j"'; fi
### End hstr

# Trying out mcfly instead of hstr
eval "$(mcfly init bash)"

#AUTO COMPLETE
function _clientdirs()
{
	local curw
	COMPREPLY=()
	curw=${COMP_WORDS[COMP_CWORD]}
	if [ "$CACHEDOUTPUT" = '' ]; then
		if [ ! -f ${HOME}/.cache_dev_folders ]; then
			CACHEDOUTPUT=$(find ${HOME}/code -maxdepth 2 ! -type f -exec ls -d -1 "{}" \; | cut -sd / -f 5- | grep -vE ".git|.idea")
			echo $CACHEDOUTPUT > ${HOME}/.cache_dev_folders
		else
			CACHEDOUTPUT=$(cat ${HOME}/.cache_dev_folders)
		fi
	fi
	COMPREPLY=($(compgen -W '${CACHEDOUTPUT}' -- $curw))
	return 0
}

complete -F _clientdirs g

### Replace less
if [ -x "`which most 2>&1`" ]; then
    alias less=most
    export PAGER=most
fi

### Set default editor to vim
if [ -x "`which vim 2>&1`" ]; then
        export EDITOR=vim
fi


# wtf does this do?
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

#broot
source /Users/paulo/.config/broot/launcher/bash/br