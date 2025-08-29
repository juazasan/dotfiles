# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

## other aliases

alias k="kubectl"
alias mc="mc -x"
alias k9s='docker run --rm -it -v "$KUBECONFIG":/root/.kube/config quay.io/derailed/k9s'