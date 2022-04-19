### Get sorted list of 20 biggest files in cwd recursively
alias bigness='du -sh * | sort -n -r | head -n 20'

### Navigation
alias ls='ls'
# alias ll='ls -lha'
alias ll='exa -abghHliS'
alias la='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias cat='bat'
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
alias aow='aws-okta write-to-credentials default ~/.aws/credentials'
alias aoe='aws-okta exec developer -- '
# aoi() { eval $(aws-okta env developer | grep -e ^export); }

### Kube
akc () { aws-okta exec developer -- kubectl "$@"; }
kc () { kubectl "$@"; }
alias gw-kops="asdf global kubectl 1.7.16 && asdf current && kubectx us-east-1.gwdocker.com"
alias goodway-staging-eks="asdf global kubectl 1.15.11 && asdf current && aws-okta exec developer -- aws eks --region us-east-1 update-kubeconfig --name goodway-staging && kubectx arn:aws:eks:us-east-1:967710342214:cluster/goodway-staging"
alias goodway-production-eks="asdf global kubectl 1.15.11 && asdf current && aws-okta exec developer -- aws eks --region us-east-1 update-kubeconfig --name goodway-production && kubectx arn:aws:eks:us-east-1:967710342214:cluster/goodway-production"
alias mk='minikube'
alias k='kubectl'
alias ktok='aws-okta exec developer -- kubectl -n kubernetes-dashboard get secret $(aws-okta exec developer -- kubectl -n kubernetes-dashboard get serviceaccount/dashboard-admin-sa -o jsonpath='{.secrets[0].name}') -o jsonpath='{.data.token}' | base64 --decode | pbcopy'

### Utility
alias cleardockernone='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias cleardocker='docker rm -f $(docker ps -q)'

### Git
alias fancylog='git log --graph --decorate --oneline'

### Actions
alias sourcebash='source ~/.bash_profile'
alias catbash='cat ~/.bash_profile'

