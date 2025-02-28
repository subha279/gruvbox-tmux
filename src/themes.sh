#!/usr/bin/env bash

SELECTED_THEME="$(tmux show-option -gv @gruvbox-tmux_theme)"
TRANSPARENT_THEME="$(tmux show-option -gv @gruvbox-tmux_transparent)"

case $SELECTED_THEME in
"dark")
  declare -A THEME=(
    ["background"]="#282828"
    ["foreground"]="#ebdbb2"
    ["black"]="#3c3836"
    ["blue"]="#458588"
    ["cyan"]="#689d6a"
    ["green"]="#98971a"
    ["magenta"]="#b16286"
    ["red"]="#cc241d"
    ["white"]="#ebdbb2"
    ["yellow"]="#d79921"

    ["bblack"]="#504945"
    ["bblue"]="#83a598"
    ["bcyan"]="#8ec07c"
    ["bgreen"]="#b8bb26"
    ["bmagenta"]="#d3869b"
    ["bred"]="#fb4934"
    ["bwhite"]="#fbf1c7"
    ["byellow"]="#fabd2f"
  )
  ;;

"light")
  declare -A THEME=(
    ["background"]="#fbf1c7"
    ["foreground"]="#3c3836"
    ["black"]="#282828"
    ["blue"]="#076678"
    ["cyan"]="#427b58"
    ["green"]="#79740e"
    ["magenta"]="#8f3f71"
    ["red"]="#9d0006"
    ["white"]="#3c3836"
    ["yellow"]="#b57614"

    ["bblack"]="#928374"
    ["bblue"]="#458588"
    ["bcyan"]="#689d6a"
    ["bgreen"]="#98971a"
    ["bmagenta"]="#b16286"
    ["bred"]="#cc241d"
    ["bwhite"]="#3c3836"
    ["byellow"]="#d79921"
  )
  ;;

*)
  # Default to Gruvbox Dark
  declare -A THEME=(
    ["background"]="#282828"
    ["foreground"]="#ebdbb2"
    ["black"]="#3c3836"
    ["blue"]="#458588"
    ["cyan"]="#689d6a"
    ["green"]="#98971a"
    ["magenta"]="#b16286"
    ["red"]="#cc241d"
    ["white"]="#ebdbb2"
    ["yellow"]="#d79921"

    ["bblack"]="#504945"
    ["bblue"]="#83a598"
    ["bcyan"]="#8ec07c"
    ["bgreen"]="#b8bb26"
    ["bmagenta"]="#d3869b"
    ["bred"]="#fb4934"
    ["bwhite"]="#fbf1c7"
    ["byellow"]="#fabd2f"
  )
  ;;
esac

# Override background with "default" if transparent theme is enabled
if [ "${TRANSPARENT_THEME}" == 1 ]; then
  THEME["background"]="default"
fi

THEME['ghgreen']="#b8bb26"
THEME['ghmagenta']="#d3869b"
THEME['ghred']="#fb4934"
THEME['ghyellow']="#fabd2f"

RESET="#[fg=${THEME[foreground]},bg=${THEME[background]},nobold,noitalics,nounderscore,nodim]"
