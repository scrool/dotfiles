#Screen sets own termcap and replace 256 colors to 8. Fix this back
if [ ! -z "$TERMCAP" ] && [ "$TERM" == "screen" ]; then                         
    export TERMCAP=$(echo $TERMCAP | sed -e 's/Co#8/Co#256/g')                  
fi

#256 colors for less (1). Mainly used in man (1).
LESS_TERMCAP_md=$'\E[38;5;151m' # begin bold
LESS_TERMCAP_us=$'\E[38;5;153m' # begin underline

#256 highlight color for grep
GREP_COLOR="48;5;149;38;5;0"
GREP_COLORS="fn=38;5;151:ln=38;5;180"

export LESS_TERMCAP_md LESS_TERMCAP_us GREP_COLOR GREP_COLORS
