### Get sorted list of 20 biggest files in cwd recursively
alias bigness='du -sh * | sort -n -r | head -n 20'

### cool guy shit
alias ferda='git add .'
alias lmao='npx git-cz'
alias 420lmao='git push'
alias sup='git status'
alias gimme='git pull'
alias tallyho='git co master'
alias imconfused='rm -rf ./node_modules'
alias 42069='npm instsall'

### Navigation
alias ls='ls'
alias ll='ls -lha'
alias la='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
cd() { builtin cd "$@"; ll; }

### hidden control chars - use filename after both
alias hiddenchars='cat -v -e -t'
alias ctrlclean="sed -i -e 's/^A/,/g'"

### Begin goodway shortcuts
alias bpa='cd ~/code/bpa/'
alias mti='cd ~/code/mti'
alias sandbox='cd ~/code/sandbox'
alias mine='cd ~/code/mine/'
alias bi='cd ~/code/bi/'
alias ml='cd ~/code/ml/'
alias mls='osascript ~/utils/ml.scpt'
alias ayylmao='osascript ~/utils.scpt'

function mlb()
{
	local BRANCH_NUMBER=$1

	git co feature/ML-${BRANCH_NUMBER}
}

### END GOODWAY

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

###PHANTOMJS
alias phantomjs='~/phantomjs/bin/phantomjs'

### Airflow login
function airflowCluster() {

    # Filter our EC2 instances for the qubole-airflow box
    local PUBLIC_IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=qubole-airflow" "Name=instance-state-name,Values=running")

    # Get the IP value
    PUBLIC_IP=$(echo $PUBLIC_IP | jq '.Reservations[0].Instances[0].PublicIpAddress')

    # Clean quotes
    PUBLIC_IP=$(echo ${PUBLIC_IP} | tr -d '"')

    # sudo rm -rf /
    ssh -i ~/.ssh/analytics.pem ec2-user@${PUBLIC_IP}
}

### Hive master login
function masterNode() {

    # Filter our EC2 instances for the master box
    local PUBLIC_IP=$(aws ec2 describe-instances --filters "Name=tag:Name,Values=master" "Name=tag:Qubole,Values=qbol_acc4669_cl13358" "Name=instance-state-name,Values=running")

    # Get the IP value
    PUBLIC_IP=$(echo $PUBLIC_IP | jq '.Reservations[0].Instances[0].PublicIpAddress')

    # Clean quotes
    PUBLIC_IP=$(echo ${PUBLIC_IP} | tr -d '"')

    ssh -i ~/.ssh/analytics.pem ec2-user@${PUBLIC_IP};

    alias ll='ls -lha'
}

complete -F _clientdirs g

### End goodway shortcuts

### Utility
alias cleardockernone='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias cleardocker='docker rm -f $(docker ps -q)'

### Git
alias fancylog='git log --graph --decorate --oneline'

### Kube
kc () { aws-okta exec developer -- kubectl "$@"; }

### Actions
alias sourcebash='source ~/.bash_profile'
alias catbash='cat ~/.bash_profile'

### Replace less
if [ -x "`which most 2>&1`" ]; then
    alias less=most
    export PAGER=most
fi

### Set default editor to vim
if [ -x "`which vim 2>&1`" ]; then
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
