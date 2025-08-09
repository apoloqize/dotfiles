# Oh My Zsh Configuration
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="robbyrussell"

# Plugins (add more as needed)
plugins=(
    git
    brew
)

# Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Homebrew-installed plugins
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# History Configuration
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_VERIFY
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

# Auto-completion
autoload -U compinit
compinit
setopt COMPLETE_ALIASES
setopt AUTO_LIST
setopt AUTO_MENU
setopt AUTO_PARAM_SLASH

# Environment Variables
export EDITOR="nvim"
export VISUAL="nvim"
export PAGER="less"
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Aliases
alias l="ls -lrth --color=auto"
alias ll="ls -lrth --color=auto"
alias ls="ls -lrth --color=auto"
alias grep="grep --color=auto"
alias vi="nvim"
alias vim="nvim"

# Find and kill process by name
killport() {
    if [ $# -eq 0 ]; then
        echo "Usage: killport <port>"
        return 1
    fi
    lsof -ti:$1 | xargs kill -9
}

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/florent/.lmstudio/bin"
# End of LM Studio CLI section
