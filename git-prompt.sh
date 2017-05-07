isBranch() {
  if [ "$(parse_git_branch)" != "" ];
  then
    return 0
  else
    return 1
  fi
}

hasDiffs() {
  if [ "$(git diff 2> /dev/null)" != "" ];
  then
    return 0
  else
    return 1
  fi
}

hasUntrackedFiles() {
  if [ "$(git status | grep 'Untracked files')" != "" ];
  then
    return 0
  else
    return 1
  fi
}

hasChangesToBeCommitted() {
  if [ "$(git status | grep 'Changes to be committed')" != "" ];
  then
    return 0
  else
    return 1
  fi
}

hasChangesToBePush() {
  if [ "$(git status | grep 'git push')" != "" ];
  then
    return 0
  else
    return 1
  fi
}

parse_git_color() {
  if isBranch; then
    if hasChangesToBePush; then
      $RED
    elif hasChangesToBeCommitted; then
      $YELLOW
    elif hasDiffs; then
      $BLUE
    elif hasUntrackedFiles; then
      $CYAN
    else
      $GREEN
    fi
  fi
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

RED="tput setaf 1"
GREEN="tput setaf 2"
YELLOW="tput setaf 3"
BLUE="tput setaf 4"
CYAN="tput setaf 6"
WHITE="tput setaf 7"
RESET=$(tput sgr0)

PS1="\u@\h:\w$\[\$(parse_git_color)\]\$(parse_git_branch)\[$RESET\] "
