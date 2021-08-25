# # Install 'pure' zsh theme if not isntalled yet
# if [ -f ~/.zsh/pure/pure.plugin.zsh ]; then
# 	mkdir -p ~/.zsh
# 	rm -rf ~/.zsh/pure
# 	git clone https://github.com/sindresorhus/pure.git ~/.zsh/pure > /dev/null 2>&1
# 	fpath+=~/.zsh/pure
# fi 

# .zshrc
fpath+=~/.zsh/pure
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
	git-flow-completion
)

source $ZSH/oh-my-zsh.sh

# BUG FIXES
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export LDFLAGS="-I /usr/local/opt/openssl@1.1/include -L /usr/local/opt/openssl@1.1/lib"

# Install and add Fzf search ( https://github.com/junegunn/fzf#usage )
brew install fzf > /dev/null 2>&1
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Init pyenv and pyenv virtual envs
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

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

# Colors for printing
RED=$'\e[1;31m'
GREEN=$'\e[1;32m'
BLUE=$'\e[1;34m'
PURPLE=$'\e[1;35m'
ENDCOLOR=$'\e[0m'
CYAN=$'\e[1;36m'
WHITE=$'\e[1;37m'

# Code dir AI aliases
alias water='cd /Users/alex.wolf/Code/water-ai-app'
alias bowtie='cd /Users/alex.wolf/Code/chatbot-web'

# # Python enviroment stuff
# CURR_ENV='water-ai-app_3.8.6'
# CURR_PYTHON_VERSION='3.8.6'
# spy(){
# 	# Activate pyenv vitual env
# 	if [ $# -eq 0 ]; then
# 		ENV=$CURR_ENV
# 	else
# 		ENV=$1
# 	fi
# 	printf "Activating pyenv "$WHITE"$ENV\n"$ENDCOLOR
# 	pyenv activate $ENV
# }

# alias pyenv_create='pyenv virtualenv' # arg1 = pythonversion; arg2 =env name
# alias pyenvv='pyenv versions'
# alias pyenva='pyenv activate'
# alias pyenvd='source deactivate'

# Compile and install dev requirments to Water ai Pyenv
pip_compile(){
	water
	spy
	pip-compile -v --output-file requirements/requirements.txt requirements/requirements.in
	pip-compile -v --output-file requirements/dev-requirements.txt requirements/dev-requirements.in
	pip-sync requirements/requirements.txt requirements/dev-requirements.txt
}


# Make regualr ls have colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Water AI Project specific stuff
export ENVIRONMENT='local'
export DJANGO_SETTINGS_MODULE="water_ai.settings"

# Django DB aliases
alias mg='./manage.py migrate'
alias mm='./manage.py makemigrations'
alias mmm='./manage.py makemigrations --merge'
alias lmj='./manage.py load_menu_json'

# Bowtie Docker Aliases
alias mgd='docker-compose run --rm chatbot-web ./manage.py migrate'
alias mmd='docker-compose run --rm chatbot-web ./manage.py makemigrations'
alias mmmd='docker-compose run --rm chatbot-web ./manage.py makemigrations --merge'
alias lmjd='docker-compose run --rm chatbot-web ./manage.py load_menu_json'

alias wp='/Users/alex.wolf/Documents/chatbot-web/node_modules/.bin/webpack --mode=production'
alias wpw='/Users/alex.wolf/Documents/chatbot-web/node_modules/.bin/webpack --mode=development --watch'

# Docker Alias
alias dp='docker ps'
alias dpsql='docker exec -it postgres psql -U bowtie'
alias dcw='dokcer exec -it chatbot-web bash'
alias dj='docker exec -it jupyter bash'

# Dev Ops ALIASES
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
alias code='cd ~/Code'

# Git
alias gs='git status'
alias gc='git commit -m'
alias gst='git stash'
alias gsta='git stash apply'
alias gl='git log'
alias glc='git log --graph --oneline --decorate --all'
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
# Resets the master branch to what it is on origin
alias grom='git checkout master; git reset --hard origin/master' 


# Ngrok for bowtie
alias ngk='ngrok http 8000'

# Gtop tool
alias gtop='docker run --rm -it --name gtop --net="host" --pid="host" aksakalli/gtop'

# Install spacy model
alias dw_spacy_en='python -m spacy download en_core_web_sm'

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

	printf "About to squash all commits on Branch "$BLUE"$BRANCH"$ENDCOLOR".\n\nAre you sure you want to continue (y/n)? "
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


kill_processes_with_port(){
	kill -9 $(lsof -t -i:$1)
}

BOWTIE_TEST_SUITE_DIR='/Users/alex.wolf/Documents/chatbot-web-tests'
run_full_test_suite(){
	cur_dir=$(pwd)

	# Get branch to run test suite for
	if [ -z "$1" ]; then
	    printf "\nNo branch supplied to run full test suite. Please supply one as first argument\n"
	    return
	else
		BRANCH=$1
	fi

	# Go to project test suite dir and pull in branch
	cd $BOWTIE_TEST_SUITE_DIR

	# Pull in latest master branch
	printf "Pulling branch "$WHITE"master"$ENDCOLOR" from origin"
	git checkout master > /dev/null 2>&1
	git pull origin master --force > /dev/null 2>&1

	# Try to merge branch with master before testing
	if [ "$BRANCH" != 'master' ]; then

		# Pull in latest branch to merge
		printf "\nPulling branch "$CYAN"$BRANCH"$ENDCOLOR" from origin\n"
		git checkout $BRANCH > /dev/null 2>&1
		git pull origin $BRANCH --force > /dev/null 2>&1

		# Try to Merge Master branch into this one
		printf "Merging branch "$CYAN"$BRANCH"$ENDCOLOR" with "$WHITE"master"$ENDCOLOR"\n"
		git merge master --no-edit > /dev/null 2>&1

		# If had merge conflict notify user and abort
		if [ $? -eq 1 ]; then
  			git merge --abort
    		printf "\n"$RED"ERROR:"$ENDCOLOR" Branch "$CYAN"$BRANCH"$ENDCOLOR" had merge conflicts with master. Please fix them on origin before running the full test suite.\n"
    		cd $cur_dir
    		return
		fi
	fi

	# Activate Bowtie Python enviroment
	pyenv activate $CURR_BOWTIE_ENV > /dev/null 2>&1

	# Run fulll test suite
	printf "\nRunning full test suite on merged branch "$CYAN"$BRANCH"$ENDCOLOR"\n\n"
	$BOWTIE_TEST_SUITE_DIR/manage.py test --nomigrations  --noinput

	cd $cur_dir

}

drop_db_connect(){
	# Drop force drop connections to a specific postgres database
	psql -U alex.wolf -c "SELECT pg_terminate_backend(pg_stat_activity.pid) FROM pg_stat_activity WHERE pg_stat_activity.datname = '${1}';"
}



# For fixing pyenv new pythoin version isntallation
# see https://github.com/pyenv/pyenv/issues/1740
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"

