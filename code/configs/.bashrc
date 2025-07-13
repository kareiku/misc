# Enable case-insensitive completion
bind "set completion-ignore-case on"

# Set up and down arrows to search in history (with readline utils)
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Enable hidden files usage like normal files
shopt -s dotglob
