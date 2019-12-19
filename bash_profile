# Add Smilies for Good and Bad Commands
PS1="\`if [ \$? = 0 ]; then echo \[\e[92m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "
export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl/lib"
export TERMINAL='iTerm.app'


# BOWTIE ALIASES
alias mm='./manage.py makemigrations'
alias mg='./manage.py migrate'
alias nbs='./manage.py shell_plus --notebook'

# DEV OPS ALIASES
alias pmo='git push origin master'
alias ddc='docker rm -f $(docker ps -aq)'
alias ddi='docker rmi -f $(docker images -q)'
alias raws='okta-aws default sts get-caller-identity'

# Add sublime test editor command to path
mkdir -p ~/bin
rm -f ~/bin/subl
ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
export PATH="~/bin:$PATH"

# Dataiku Start Alias
alias dsss='~/Library/DSS/dss_home/bin/dss start'

# Common
alias h='history'
alias q='exit'
alias c='clear'
alias lsa='ls -a'
alias lsl='ls -l'

# Program Aliases
alias py='python'
alias bpy='source ~/Documents/chatbot-web/env/bin/python; python'
alias spy='source ~/Documents/chatbot-web/env/bin/activate'


# Bash
alias ebash='subl ~/.bash_profile'
alias sbash='source ~/.bash_profile'

# Directories
alias home='cd ~'
alias bowtie='cd ~/Documents/chatbot-web'
alias desk='cd ~/Desktop'
alias doc='cd ~/Documents'
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
alias o='open'

# Git
alias gt='git status'
alias gc='git commit -m'
alias gt='git stash'
alias gl='git log'
alias gaa='git add -A'
alias ga='git add'
alias gd='git diff'
alias gpo='git push origin'
alias gpom='git push origin master'

# lr:  Full Recursive Directory Listing
alias lr='ls -R | grep ":$" | sed -e '\''s/:$//'\'' -e '\''s/[^-][^\/]*\//--/g'\'' -e '\''s/^/   /'\'' -e '\''s/-/|/'\'' | less'

# Let there be color in grep!
export GREP_OPTIONS=' — color=auto'

# Bug Fixes
#-----
# Open SLL for psycopg2 install
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib"
export CPPFLAGS="-I/usr/local/opt/openssl@1.1/include"
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
