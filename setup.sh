# Symlinks
ln -s ~/dotfiles/.bash_profile ~/
ln -s ~/dotfiles/.vimrc ~/

# Install homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Kubernetes
brew install kubectl 

# Utilities
brew install autojump hstr bash-completion awscli

### Node install
brew install nvm
mkdir ~/.nvm

### End Node install

### Python install following https://medium.com/@briantorresgil/definitive-guide-to-python-on-mac-osx-65acd8d969d0
brew install pyenv
brew install openssl readline sqlite3 xz zlib

# Install python 3.x
brew install python
# Install pipx to manage global packages
python3 -m pip install --user pipx
python3 -m userpath append ~/.local/bin
# Install global packages
python3 -m pipx install flake8
python3 -m pipx install black

# Install 2.7 to proteect system python
brew install python@2

### End Python install

