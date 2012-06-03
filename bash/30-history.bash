# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
# ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

#How can I avoid losing any history lines: http://wooledge.org:8000/BashFAQ/088
#Also see PROMPT_COMMAND
unset HISTFILESIZE
export HISTSIZE=5000
# Save timestamps in the history file.
export HISTTIMEFORMAT='%m-%d %H:%M:%S | '
# & = duplicate lines,
export HISTIGNORE="&:exit;ls;cd;cd ..;..*"

#Expects 10-prompt script to be run already
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
