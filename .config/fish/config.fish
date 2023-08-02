if status is-interactive
    # Commands to run in interactive sessions can go here
    set -g fish_greeting
    alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
    
    source (/usr/bin/starship init fish --print-full-init | psub)
end
