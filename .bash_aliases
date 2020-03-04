### Get sorted list of 20 biggest files in cwd recursively
alias bigness='du -sh * | sort -n -r | head -n 20'

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