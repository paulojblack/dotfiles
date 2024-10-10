export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### PYTHON

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# Rust
# . "$HOME/.cargo/env"

# Golang
export GOPATH=$HOME/go
# export GOROOT=/usr/local/opt/go/libexec
# export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH/bin
# export PATH=$PATH:$GOROOT/bin

# Terraform
alias tf="terraform"

alias pb="go build -o preen main.go"