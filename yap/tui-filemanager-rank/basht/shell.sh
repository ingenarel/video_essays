#!/usr/bin/sh

HOME="$(realpath --canonicalize-missing "$0/../HOME" )"
export HOME

[ ! -d "$HOME/.config" ] && mkdir --parents "$HOME/.config"
[ ! -d "$HOME/.local/bin" ] && mkdir --parents "$HOME/.local/bin"
PATH="$PATH:$HOME/.local/bin"
export PATH

#@formatter:off
# shellcheck disable=SC2015
[ ! -d "$HOME/source" ] && {
    git clone https://gitlab.com/christosangel/basht.git "$HOME/source" && {
        cd "$HOME/source" &&
        ./install.sh
    } ||
    exit
} || {
    git -C "$HOME/source" pull
}
#@formatter:on

"$SHELL" -i
