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

### Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

### Bash Completion
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

### ASDF
. /usr/local/opt/asdf/asdf.sh
. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
