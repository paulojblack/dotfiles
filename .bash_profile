export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"

for f in ~/dotfiles/config/*; do source ${f}; done
source ~/.credentials

### Set default editor to vim
if [ -x "`which vim 2>&1`" ]; then
        export EDITOR=vim
fi

# Created by `userpath` on 2020-01-12 00:28:43
export PATH="$PATH:/Users/paulo/.local/bin"
