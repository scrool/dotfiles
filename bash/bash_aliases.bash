# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Try support first
ls --group-directories-first -d . >/dev/null 2>&1
if [ $? == 0 ]
then
    alias ll='ls -l --group-directories-first'
else
    # Source: http://tldp.org/LDP/abs/html/sample-bashrc.html
    function ll()
    {
        ls -l "$@"| egrep "^d" ; ls -lXB "$@" 2>&-| egrep -v "^d|total ";
    }
fi

alias cd..='cd ..' 

# Graphic man
gman () { yelp "man:$@"; }
