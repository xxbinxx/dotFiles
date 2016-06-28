. ~/.scripts/virtual_env_autoactivate
. ~/.scripts/show_git_dirty_in_prompt
. ~/.scripts/change_prompt_view

#custom command for my projects
vu() { cd "/home/bineet/workspace/Vuevent/vuevents"; workon vuevent; }
ve() { cd "/home/bineet/workspace/vevent" ; workon vevent; }
mm() {  echo makemigrations migrate | xargs -n 1 python manage.py ;}

# virtualenv
export WORKON_HOME=~/virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Make new shells get the history lines from all previous
# shells instead of the default "last window closed" history
export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# Increase the maximum number of lines contained in the history file
# (default is 500)
export HISTFILESIZE=10000

# Increase the maximum number of commands to remember
# (default is 500)
export HISTSIZE=10000

# Don't clear the screen after quitting a manual page
export MANPAGER="less -X"

# Make vim the default editor
export EDITOR="vim"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups
