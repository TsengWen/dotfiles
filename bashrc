## Set git prompt

function git_branch {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    echo "("${ref#refs/heads/}")";
}

function git_tag {
  ref=$(git describe --tags 2> /dev/null) || return;
    echo "("tag:${ref}")";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m";
}

PS1="${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[00m\]@\[\033[01;36m\]\h\[\033[00m\]:[\[\033[1;32m\]\w\[\033[0m\]]\[\033[0m\]\[\033[1;36m\]\$(git_branch)\$(git_tag)\[\033[0;33m\]\$(git_since_last_commit)\[\033[0m\]$ "

