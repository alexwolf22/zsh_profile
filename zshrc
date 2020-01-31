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

# Add npm and node modules to path
export PATH="/usr/local/opt/node@10/bin:$PATH"

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
export LDFLAGS="-I /usr/local/opt/openssl@1.1/include -L /usr/local/opt/openssl@1.1/lib"

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

# Add color ls
alias lc='colorls -lA --sd'

# Make regualr ls have colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# BOWTIE ALIASES
alias mg='docker-compose run --rm chatbot-web ./manage.py migrate'
alias mm='docker-compose run --rm chatbot-web ./manage.py makemigrations'
alias mmm='docker-compose run --rm chatbot-web ./manage.py makemigrations --merge'
alias lmj='docker-compose run --rm chatbot-web ./manage.py load_menu_json'

alias wp='/Users/alex.wolf/Documents/chatbot-web/node_modules/.bin/webpack'
alias wpw='/Users/alex.wolf/Documents/chatbot-web/node_modules/.bin/webpack --watch'

# Docker Alias
alias dp='docker ps'
alias dpsql='docker exec -it postgres psql -U bowtie'
alias dcw='dokcer exec -it chatbot-web bash'
alias dj='docker exec -it jupyter bash'

# DEV OPS ALIASES
alias pmo='git push origin master'
alias ddc='docker rm -f $(docker ps -aq)'
alias ddi='docker rmi -f $(docker images -q)'


# Dataiku Start Alias
alias dsss='/Users/alex.wolf/Library/DataScienceStudio/dss_home/bin/dss start'
alias dssst='/Users/alex.wolf/Library/DataScienceStudio/dss_home/bin/dss stop'

# Common
alias h='history'
alias q='exit'
alias c='clear'
alias lsa='ls -a'
alias lsl='ls -l'
# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Python Aliases
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
alias gsta='git stash apply'
alias gl='git log'
alias gaa='git add -A'
alias ga='git add'
alias gd='git diff'
alias gm='git merge'
alias gpo="git push origin"
alias gpom='git push origin master'
alias gpu='git pull origin'
alias gpum='git pull origin master'
alias gch='git checkout'
alias gchm='git checkout master'
alias gbn='git checkout -b'          # Create new git branch
alias gb='git branch'
alias gba='git branch -a'
alias grs='git reset --soft HEAD~1'   # Undo last coommit keep changes
alias grh='git reset --hard HEAD~1'   # Undo last commit remove changes
alias gr='git reset'                  # Remove all staged files for commit
# Resets the amster branch to what it is on origin
alias grom='git checkout master; git reset --hard origin/master' 


# Ngrok for bowtie
alias ngk='ngrok http 8000'

# Gtop tool
alias gtop='docker run --rm -it --name gtop --net="host" --pid="host" aksakalli/gtop'

# Install spacy model
alias dw_spacy_en='python -m spacy download en_core_web_sm'

# Colors for printing
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
BLUE=$'\e[1;34m'
PURPLE=$'\e[1;35m'
ENDCOLOR=$'\e[0m'
CYAN=$'\e[1;36m'
WHITE=$'\e[1;37m'

# convert pycharm relative path to test path
tp () {
	local test_path="${1//\//.}"
	printf "\n"$WHITE"${test_path//.py/}"$ENDCOLOR"\n"
}

# delete_local_merged_branches () {

# 	strip_branch_names () {
# 		for i in $1; do
			
# 	}
# 	branches=("${(@f)$(git branch --no-merged)}")
# 	for branch in $branches; do
# 		branch="${branch// /}"
# 		# git branch -d $branch
# 	done
# }

squash_all_commits() {
	BRANCH=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')

	if [ "$BRANCH" = 'master' ]
	then
		echo "You are on the "$CYAN"master"$ENDCOLOR" branch. Not able to squash commits"$RED" exiting"$ENDCOLOR"."
		exit 1
	fi

	printf "About to squash all commits on Branch "$BLUE"$BRANCH"$ENDCOLOR".\n\nAre you sure you want to continue?"
	read user_continue
	if [ "$user_continue" != 'y' ]
	then
	    echo 'Ok, bye.'
	    exit 1
	fi

	# Make sure master brnach is updated first
	printf "\n\nUpdating your local master branch first\n"
	git checkout master
	git pull origin master
	git checkout $BRANCH

	printf "\n\nPlease enter a commit message for the squash: "
	read commit_message

	git reset $(git merge-base origin/master $BRANCH)
 	git add -A
 	git commit -m "$commit_message"
}

ZSH_GIT_PATH='/Users/alex.wolf/Documents/github/zsh_profile'
zsh_git_push() {
	cur_dir=$(pwd)
	cd $ZSH_GIT_PATH

	zsh_git_path="${ZSH_GIT_PATH}/zshrc"
	/bin/cp -rf ~/.zshrc $zsh_git_path

	if [[ `git status --porcelain` ]]; then
		# Changes
		git add -A
		git commit -m 'updated .zshrc'
		git push origin master
	else
		echo "\nNo changes in .zshrc file"
	fi

	cd $cur_dir
}


BOWTIE_DIR='/Users/alex.wolf/Documents/chatbot-web'
pip_compile() {
	cur_dir=$(pwd)
	if [ "$1" != 'prod' ] && [ "$1" != 'dev' ]; then
		echo "\nPlease pass 'dev' or 'prod' as the first arguemnt to the call"
	else
		in_file="${BOWTIE_DIR}/requirements/${1}.in"
		output_file="${BOWTIE_DIR}/requirements/${1}.txt"
		/Users/alex.wolf/Documents/general_env/bin/pip-compile -v --output-file $output_file $in_file

		#Fix the security libs Bowtie requires
		search='msgpack==.*'
		replacement='msgpack==0.6.1            # custom version upgrade for Bowtie'
		sed -i '' "s/${search}/${replacement}/" $output_file

		search='urllib3==.*'
		replacement='urllib3==1.25.2           # custom version upgrade for Bowtie'
		sed -i '' "s/${search}/${replacement}/" $output_file
	fi
}

move_envs_b(){
	mv /Users/alex.wolf/Documents/chatbot-web/env27 /Users/alex.wolf/Documents/env27
	mv /Users/alex.wolf/Documents/chatbot-web/env37 /Users/alex.wolf/Documents/env37
}

move_envs_f() {
	mv /Users/alex.wolf/Documents/env27 /Users/alex.wolf/Documents/chatbot-web/env27
	mv /Users/alex.wolf/Documents/env37 /Users/alex.wolf/Documents/chatbot-web/env37
}

alias frize='/Users/alex.wolf/Documents/general_env/bin/futurize'

apply_fix() {
	cd '/Users/alex.wolf/Documents/chatbot-web'
	/Users/alex.wolf/Documents/general_env/bin/futurize -w -n -f $1 -j 12 **/*.py
}

apply_23fix() {
	cd '/Users/alex.wolf/Documents/chatbot-web'
	/usr/local/bin/2to3 -w -n -f $1 -j 12 **/*.py
}
