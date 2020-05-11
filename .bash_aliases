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
alias mls='osascript ~/dotfiles/utils/ml.scpt'
alias ayylmao='osascript ~/dotfiles/utils/ml.scpt'

### Kube
kc () { aws-okta exec dev -- kubectl "$@"; }
alias gw-kops="asdf global kubectl 1.7.16 && asdf current && kubectx us-east-1.gwdocker.com"
alias goodway-staging-eks="asdf global kubectl 1.15.11 && asdf current && aws-okta exec dev -- aws eks --region us-east-1 update-kubeconfig --name goodway-staging && kubectx arn:aws:eks:us-east-1:967710342214:cluster/goodway-staging"
alias goodway-production-eks="asdf global kubectl 1.15.11 && asdf current && aws-okta exec dev -- aws eks --region us-east-1 update-kubeconfig --name goodway-production && kubectx arn:aws:eks:us-east-1:967710342214:cluster/goodway-production"

### Utility
alias cleardockernone='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias cleardocker='docker rm -f $(docker ps -q)'

### Git
alias fancylog='git log --graph --decorate --oneline'

### Actions
alias sourcebash='source ~/.bash_profile'
alias catbash='cat ~/.bash_profile'

###PHANTOMJS
alias phantomjs='~/phantomjs/bin/phantomjs'
