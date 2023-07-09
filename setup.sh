#!/usr/bin/env bash

set -euo pipefail

sh -c "$(curl -fsLS get.chezmoi.io)" -- init --ssh --force --apply --source "${HOME}/.dot" averagebit

