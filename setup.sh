#!/usr/bin/env bash

set -euo pipefail

if ! type nix &>/dev/null; then
    curl -L https://nixos.org/nix/install | sh -s -- --no-modify-profile --no-daemon  --yes
    source "${HOME}/.nix-profile/etc/profile.d/nix.sh"
    nix-channel --add https://nixos.org/channels/nixpkgs-unstable
fi

nix build --experimental-features "nix-command flakes"
exec ./result/bin/chezmoi init --ssh --source ~/.dot --force --apply averagebit
