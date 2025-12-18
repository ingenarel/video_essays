#!/usr/bin/sh

HOME="$(realpath --canonicalize-missing "$0/../HOME" )"
export HOME

[ ! -d "$HOME/.config" ] && mkdir --parents "$HOME/.config"
[ ! -d "$HOME/.local/bin" ] && mkdir --parents "$HOME/.local/bin"
PATH="$PATH:$HOME/.local/bin"
export PATH
{
    git clone https://gitlab.com/christosangel/basht.git "$HOME/source" ||
    git -C "$HOME/source" pull
} ||
exit

cd "$HOME/source" || exit
./install.sh || exit

"$SHELL" -i
