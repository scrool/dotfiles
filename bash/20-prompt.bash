# Don't set PS1 if it wasn't already set. It could be later used to detect non
# interactive shell.
if [ -n "$PS1" ]
then
    use_color_prompt
    color_prompt=$?
    if [ "$color_prompt" = 1 ]; then
        set_ps1 "short"
        unset set_ps1
    else
        PS1='\u@\h:\w\$ '
    fi
    export PS1
fi

PROMPT_COMMAND="update_short_pwd;$PROMPT_COMMAND"
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=$PROMPT_COMMAND'echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\007";'
    ;;
screen|screen-256color)
    PROMPT_COMMAND=$PROMPT_COMMAND'echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/$HOME/~}\033\\";'
    ;;
*)
    ;;
esac

unset color_prompt force_color_prompt
