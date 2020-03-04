### PS1
export PS1="________________________________________________________________________________\n| [\[\033[32m\]\w]\[\033[0m\]\$(__git_ps1)\n\[\033[1;36m\]=>\[\033[32m\]$ \[\
\033[0m\]"

export __LS_OPTIONS='--color=auto -h'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacadexport CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad
### End PS1

### Do I use this?
# function allcolors() {
#     # credit to http://askubuntu.com/a/279014
#     for x in 0 1 4 5 7 8; do
#         for i in `seq 30 37`; do
#             for a in `seq 40 47`; do
#                 echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
#             done
#             echo
#         done
#     done
#     echo ""
# }
