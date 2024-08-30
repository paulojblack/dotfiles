### Autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh

### Load brew into env
eval "$(/opt/homebrew/bin/brew shellenv)"

### Source Bash Completion
. $(brew --prefix)/etc/bash_completion.d/git-completion.bash
. $(brew --prefix)/etc/bash_completion.d/git-prompt.sh

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### ASDF
. "$HOME/.asdf/asdf.sh"
. "$HOME/.asdf/completions/asdf.bash"

## autonvm switching
enter_directory() {
  if [[ $PWD == $PREV_PWD ]]; then
    return
  fi

  PREV_PWD=$PWD
  [[ -f ".nvmrc" ]] && nvm use
}
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND} enter_directory;"


export HISTFILESIZE=10000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
export PROMPT_COMMAND="${PROMPT_COMMAND:+$PROMPT_COMMAND} history -a; history -n;"   # mem/file sync


# Trying out mcfly instead of hstr
# eval "$(mcfly init bash)"

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

rando() {
    local min=$1
    local max=$2
    if [[ -z "$min" || -z "$max" ]]; then
        echo "Usage: rando <min> <max>"
        return 1
    fi
    hexdump -n 2 -e '/2 "%u\n"' /dev/random | awk -v min="$min" -v max="$max" '{print int(min + ($1 % (max - min + 1)))}'
}
