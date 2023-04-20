#!/usr/bin/env bash

set -euo pipefail

if ! type git &>/dev/null; then
    echo "error: git not found"
    exit 1
fi

if ! type nix &>/dev/null; then
    curl -L https://nixos.org/nix/install | sh -s -- --no-modify-profile --no-daemon --yes
    source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
fi

if [ ! -e "${HOME}/.dot" ]; then
    git clone git@github.com:averagebit/dotfiles "${HOME}/.dot"
fi

cd "${HOME}/.dot"
nix build --experimental-features "nix-command flakes"
./result/bin/chezmoi init --ssh --force --apply --source "${HOME}/.dot" averagebit
exec nix-env -iA nixpkgs.user

