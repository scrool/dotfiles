use_color_prompt()
{
    color_prompt=0
    # set a fancy prompt (non-color, unless we know we "want" color)
    # gnome-terminal thinks it is xterm
    case "$TERM" in
        xterm-color|xterm-256color|gnome-256color) color_prompt=1;;
    esac

    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
        # We have color support; assume it's compliant with Ecma-48
        # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
        # a case would tend to support setf rather than setaf.)
        color_prompt=1
    fi
    return $color_prompt
}

##################################################
 # Fancy PWD display function
 ##################################################
 # The home directory (HOME) is replaced with a ~
 # The last pwdmaxlen characters of the PWD are displayed
 # Leading partial directory names are striped off
 # /home/me/stuff          -> ~/stuff               if USER=me
 # /usr/share/big_dir_name -> ../share/big_dir_name if pwdmaxlen=20
##################################################
function update_short_pwd() {
    # How many characters of the $PWD should be kept
    local pwdmaxlen=20
    # Indicate that there has been dir truncation
    local trunc_symbol="…" #..."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    SHORT_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#SHORT_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
        SHORT_PWD=${SHORT_PWD:$pwdoffset:$pwdmaxlen}
        TRUNC=${trunc_symbol}
    else
        TRUNC=
    fi
}

function set_ps1() {
    local use_short=$1
    local NO="\[\033[0m\]"    # unsets color to term's fg color
   
    # dark colors
    local LR="\[\033[1;31m\]"
    local DG="\[\033[1;36m\]"
    local LB="\[\033[1;34m\]"
   
    # background colors
    local BGK="\[\033[40m\]"
   
    #256 farieb
    local LR="\[\033[38;5;174m\]"
    local LG="\[\033[38;5;151m\]"
    local LB="\[\033[38;5;110m\]"
    
    local UC=$LG                # user's color
    if [[ ${EUID} == 0 ]] ; then
        UC=$LR                  # root's color
    fi
   
    if [[ ${use_short} = "short" ]]; then
        #local MY_PWD="${NO}${BGK}\${TRUNC}${LB}\${SHORT_PWD}"
        local MY_PWD="${NO}\${TRUNC}${LB}\${SHORT_PWD}"
    fi
    #PS1="${BGK}${UC}\u@\h${NO}${BGK}:${MY_PWD:-${LB}\w}${NO}${BGK}\$${NO} "
    PS1="${UC}\u@\h${NO}:${MY_PWD:-${LB}\w}${NO}\$${NO} "
}


