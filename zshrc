# Install 'pure' zsh theme if not isntalled yet
if [ -f ~/.zsh/pure/pure.plugin.zsh ]; then
	mkdir -p ~/.zsh
	rm -rf ~/.zsh/pure
	git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure > /dev/null 2>&1
	fpath+=~/.zsh/pure
fi 

# .zshrc
autoload -U promptinit; promptinit
prompt pure

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERMINAL='iTerm.app'

# Add sublime test editor command to path
# mkdir -p ~/bin
# rm -f ~/bin/subl
# ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
# export PATH="~/bin:$PATH"

# Path to your oh-my-zsh installation.
export ZSH="/Users/alex.wolf/.oh-my-zsh"

# Highligh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	osx
	sublime
)

source $ZSH/oh-my-zsh.sh

# BUG FIXES
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"

# Install and add Fzf search ( https://github.com/junegunn/fzf#usage )
brew install fzf > /dev/null 2>&1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#ASCII Art Splash Screen
#python3 ~/Documents/github/ASCII-Art-Splash-Screen/ascii.py


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Delete all Alias's defined by ZSh and plugins
unalias -m '*'

# Make Parrot
alias parrot='curl parrot.live'

# Make LS Colorful
alias lc='colorls -lA --sd'

# BOWTIE ALIASES
alias mg='docker-compose run --rm chatbot-web ./manage.py migrate'
alias mm='docker-compose run --rm chatbot-web ./manage.py makemigrations'
alias mmm='docker-compose run --rm chatbot-web ./manage.py makemigrations --merge'

# Docker Alias
alias dp='docker ps'
alias dpg='docker exec -it postgres psql -U bowtie'

# DEV OPS ALIASES
alias pmo='git push origin master'
alias ddc='docker rm -f $(docker ps -aq)'
alias ddi='docker rmi -f $(docker images -q)'
alias raws='source ~/Documents/chatbot-web/env/bin/activate; okta_aws default sts get-caller-identity; deactivate'

# Dataiku Start Alias
alias dsss='~/Library/DataScienceStudio/dss_home/bin/dss start'
alias dssst='~/Library/DataScienceStudio/dss_home/bin/dss stop'

# Common
alias h='history'
alias q='exit'
alias c='clear'
alias lsa='ls -a'
alias lsl='ls -l'
# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Program Aliases
alias py='python'
alias bpy='source ~/Documents/chatbot-web/env/bin/python; python'
alias spy='source ~/Documents/chatbot-web/env/bin/activate'

# Bash
alias ebash='subl ~/.bash_profile'
alias sbash='source ~/.bash_profile'

# ZSH
alias ezsh='subl ~/.zshrc'
alias szsh='source ~/.zshrc'

# Directories
alias ~='cd ~'
alias bowtie='cd ~/Documents/chatbot-web'
alias dss='cd /Users/alex.wolf/Library/DataScienceStudio/dss_home'
alias desk='cd ~/Desktop'
alias doc='cd ~/Documents'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias o='open'

# color ls tab completion
source $(dirname $(gem which colorls))/tab_complete.sh

# Git
alias gs='git status'
alias gc='git commit -m'
alias gst='git stash'
alias gsa='git stash apply'
alias gl='git log'
alias gaa='git add -A'
alias ga='git add'
alias gd='git diff'
alias gpom='git push origin master'
alias gpo="git push origin $(git rev-parse --abbrev-ref HEAD)"
alias gpull='git pull origin master'

# Gtop tool
alias gtop='docker run --rm -it --name gtop --net="host" --pid="host" aksakalli/gtop'
