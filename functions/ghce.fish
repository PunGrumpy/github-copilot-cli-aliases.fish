function ghce
    set --local FUNCNAME ghce
    set GH_DEBUG $GH_DEBUG

    set --local __USAGE "Wrapper around `gh copilot explain` to explain a given input command in natural language.

USAGE
  $FUNCNAME [flags] <command>

FLAGS
  -d, --debug   Enable debugging
  -h, --help    Display help usage

EXAMPLES

# View disk usage, sorted by size
$FUNCNAME 'du -sh | sort -h'

# View git repository history as text graphical representation
$FUNCNAME 'git log --oneline --graph --decorate --all'

# Remove binary objects larger than 50 megabytes from git history
$FUNCNAME 'bfg --strip-blobs-bigger-than 50M'"

    argparse d/debug h/help -- $argv
    or return

    if set --query _flag_help
        echo $__USAGE
        return 0
    end

    if set --query _flag_debug
        set GH_DEBUG api
    end

    GH_DEBUG="$GH_DEBUG" gh copilot explain $argv
end
