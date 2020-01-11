export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

for f in ~/dotfiles/config/*; do source ${f}; done
source ~/.credentials

# Unused?
### Replace less
# if [ -x "`which most 2>&1`" ]; then
#     alias less=most
#     export PAGER=most
# fi

### Set default editor to vim
if [ -x "`which vim 2>&1`" ]; then
        export EDITOR=vim
fi
