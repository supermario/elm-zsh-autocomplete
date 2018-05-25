# Elm Autocomplete plugin
# Requires: Elm >= 0.19
# Author: Mario Rogic (https://mario.net.au)

_elm () {
    local -a _1st_arguments

    _1st_arguments=($(elm autocomplete 1))

    _arguments '*:: :->subcmds' && return 0

    if (( CURRENT == 1 )); then
        _describe -t commands "elm subcommand" _1st_arguments
        return
    fi

    _2nd_arguments=($(elm autocomplete 2 $words[1] -))

    _arguments $_2nd_arguments
}

compdef _elm elm
