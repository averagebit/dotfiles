#!/usr/bin/env bash

set -euo pipefail

# TODO: install chezmoi, nix, packages

chezmoi init --ssh --source ~/.dot --force --apply averagebit
