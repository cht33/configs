#!/bin/bash

# +--------+
# | System |
# +--------+
alias shutdown='sudo shutdown now'
alias restart='sudo reboot'
alias bigf= 'find / -xdev -type f -size +500M'  # display "big" files > 500M

# +----+
# | ls |
# +----+
alias ls='ls --color=auto'
alias lsl='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias l='ls -CF'

# +----+
# | cp |
# +----+
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -i'
alias la='ls -alh'

# +------+
# | grep |
# +------+
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# +------+
# | ping |
# +------+
alias pg='ping 8.8.8.8'

# +------+
# | time |
# +------+
alias time='/usr/bin/time'

# +--------+
# | netctl |
# +--------+
alias wifi='sudo wifi-menu -o'

# +---------+
# | netstat |
# +---------+
alias port="netstat -tulpn | grep"

# +-----+
# | Git |
# +-----+
alias gs='git status -sb'
alias gd='git diff'
alias gco='git commit'
alias gca='git commit --amend'
alias gaa='git add --all'
alias ga='git add'
alias gt='git log --graph --oneline --decorate'
alias gps='git push'
alias gpr='git pull'
alias gf='git fetch'
alias gch='git checkout'
alias gr='git branch -r'
alias gb='git branch'
alias gl='git log'
alias glo='git log --pretty="oneline"'

# +------+
# | tmux |
# +------+
alias tmk='tmux kill-session -t'
alias tma='tmux attach -t'
alias tml='tmux list-sessions'
alias tmn='tmux new -s'

