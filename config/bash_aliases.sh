### Get sorted list of 20 biggest files in cwd recursively
alias bigness='du -sh * | sort -n -r | head -n 20'

### Navigation General
alias ls='ls'
alias ll='ls -lha'
alias la='ls -la'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
cd() { builtin cd "$@"; ll; }

### Navigation Specific
alias ml='cd ~/code/ml'

### hidden control chars - use filename after both
alias hiddenchars='cat -v -e -t'
alias ctrlclean="sed -i -e 's/^A/,/g'"

### Actions
alias sourcebash='source ~/.bash_profile'
alias catbash='cat ~/.bash_profile'

### Git
alias fancylog='git log --graph --decorate --oneline'

### Docker
alias cleardockernone='docker rmi $(docker images | grep "^<none>" | awk "{print $3}")'
alias cleardocker='docker rm -f $(docker ps -q)'