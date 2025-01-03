### Get sorted list of 20 biggest files in cwd recursively
alias bigness='du -sh * | sort -n -r | head -n 20'

### Navigation
alias ls='ls'
# alias ll='ls -lha'
alias ll='eza -abghHliS'
alias la='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias cat='bat'
cd() { builtin cd "$@"; ll; }

alias code='cursor'


### hidden control chars - use filename after both
alias hiddenchars='cat -v -e -t'
alias ctrlclean="sed -i -e 's/^A/,/g'"

### Kube
akc () { aws-okta exec developer -- kubectl "$@"; }
kc () { kubectl "$@"; }

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

