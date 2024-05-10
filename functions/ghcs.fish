function ghcs
    set --local FUNCNAME ghcs
    set --local TARGET shell
    set GH_DEBUG $GH_DEBUG

    set --local __USAGE "Wrapper around `gh copilot suggest` to suggest a command based on a natural language description of the desired output effort.
Supports executing suggested commands if applicable.

USAGE
  $FUNCNAME [flags] <prompt>

FLAGS
  -d, --debug              Enable debugging
  -h, --help               Display help usage
  -t, --target target      Target for suggestion; must be shell, gh, git
                           default: '$TARGET'

EXAMPLES

- Guided experience
  $FUNCNAME

- Git use cases
  $FUNCNAME -t git 'Undo the most recent local commits'
  $FUNCNAME -t git 'Clean up local branches'
  $FUNCNAME -t git 'Setup LFS for images'

- Working with the GitHub CLI in the terminal
  $FUNCNAME -t gh 'Create pull request'
  $FUNCNAME -t gh 'List pull requests waiting for my review'
  $FUNCNAME -t gh 'Summarize work I have done in issues and pull requests for promotion'

- General use cases
  $FUNCNAME 'Kill processes holding onto deleted files'
  $FUNCNAME 'Test whether there are SSL/TLS issues with github.com'
  $FUNCNAME 'Convert SVG to PNG and resize'
  $FUNCNAME 'Convert MOV to animated PNG'"

    argparse d/debug h/help t/target= -- $argv
    or return

    if set --query _flag_help
        echo $__USAGE
        return 0
    end

    if set --query _flag_debug
        set GH_DEBUG api
    end

    if set --query _flag_target
        set TARGET $_flag_target
    end

    set TMPFILE (mktemp -t gh-copilotXXX)
    function cleanup
        rm -f $TMPFILE
    end
    trap cleanup EXIT

    if GH_DEBUG="$GH_DEBUG" gh copilot suggest -t "$TARGET" $argv --shell-out $TMPFILE
        if test -s $TMPFILE
            set FIXED_CMD (cat $TMPFILE)
            history merge
            history add "$FIXED_CMD"
            echo
            eval $FIXED_CMD
        end
    else
        return 1
    end
end

