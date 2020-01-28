if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

if [ -f $(brew --prefix)/Cellar/git/2.21.0/etc/bash-bash_completion.d/git-completion.bash ]; then
    . $(brew --prefix)/Cellar/git/2.21.0/etc/bash-bash_completion.d/git-completion.bash
fi

if [ -f $(brew --prefix)/Cellar/git/2.21.0/etc/bash-bash_completion.d/git-prompt.sh ]; then
    . $(brew --prefix)/Cellar/git/2.21.0/etc/bash-bash_completion.d/git-prompt.sh
fi

alias l='ls -F -G'
alias ll='ls -alG'

export PATH="/usr/local/opt/libpq/bin:/usr/local/anaconda3/bin:$PATH"

GIT_PS1_SHOWDIRTYSTATE=true

export CLICOLOR=1
export PS1='\[\033[01;34m\]\w\[\033[00m\]$(__git_ps1)\$ '
# export PS1='[\u@mbp \w$(__git_ps1)]\$ '
