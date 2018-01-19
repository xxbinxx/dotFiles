
if [ -f ~/dotfiles/virtual_env_autoactivate ]; then
    source ~/dotfiles/virtual_env_autoactivate
fi

if [ -f ~/dotfiles/show_git_dirty_in_prompt ]; then
    source ~/dotfiles/show_git_dirty_in_prompt
fi

#if [ -f change_prompt_view ]; then
    #. change_prompt_view
#fi

if [ -f ~/dotfiles/bash_aliases ]; then
    source ~/dotfiles/bash_aliases
fi

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

# Make vim the default editor1
export EDITOR="vim"

# Ignore duplicate commands in the history
export HISTCONTROL=ignoredups
