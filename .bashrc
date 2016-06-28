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
