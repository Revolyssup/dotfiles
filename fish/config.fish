#aliases
alias cls="clear"
alias k="kubectl"
alias k2="kubectl --kubeconfig ~/.kube/config2"
alias k4="kubectl --kubeconfig ~/.kube/config4"
alias lj="luajit"
alias sshapi7="ssh -i ~/api7 root@43.154.112.59"
alias vim="nvim"
alias kb="kubebuilder"
alias cat="bat"
alias c="code ."
#export PATH=$PATH:$(go env GOPATH)/bin
alias gcm="git checkout master"
function usego121
    export PATH="/opt/homebrew/opt/go@1.20/bin:$PATH"
end

alias aic="cd ~/dev/apisix-ingress-controller"
alias n="nvim ."
alias lg="lazygit"

function sync_dotfiles
    cp -r ~/.config/nvim/ ~/dev/dotfiles/nvim/
end

#alias tmx=tmux
#export PATH=/opt/homebrew/bin/openresty/bin:$PATH


eval "$(zoxide init fish)"
if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source
