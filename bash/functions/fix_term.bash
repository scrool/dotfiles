fix_term()
{
    #From: http://vim.wikia.com/wiki/256_colors_in_vim
    if [ "$TERM" = "xterm" ] ; then
        if [ -z "$COLORTERM" ] ; then
            if [ -n "$XTERM_VERSION" ] ; then
                case "$XTERM_VERSION" in
                "XTerm(256)") TERM="xterm-256color" ;;
                "XTerm(88)") TERM="xterm-88color" ;;
                "XTerm") ;;
                *)
                    echo "Warning: Unrecognized XTERM_VERSION: $XTERM_VERSION"
                    ;;
                esac
            else
                echo "Warning: Terminal wrongly calling itself 'xterm'."
            fi
        else
            case "$COLORTERM" in
                gnome-terminal)
                    # Those crafty Gnome folks require you to check COLORTERM,
                    # but don't allow you to just *favor* the setting over
                    # TERM. Instead you need to compare it and perform some
                    # guesses based upon the value. This is, perhaps, too
                    # simplistic.
                    TERM="gnome-256color"
                    ;;
                *)
                    echo "Warning: Unrecognized COLORTERM: $COLORTERM"
                    ;;
            esac
        fi
    fi
}
