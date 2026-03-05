#!/usr/bin/env bash

# Default to gobyte-qt if no arguments are provided
cmd="gobyte-qt"

# If the first argument is one of the specific commands, use it instead
if [[ "$1" == "gobyted" || "$1" == "gobyte-cli" || "$1" == "gobyte-tx" || "$1" == "gobyte-wallet" ]]; then
  cmd="$1"
  # Remove the command from the arguments list
  shift
fi

# Execute the chosen command with all remaining arguments
exec "/app/bin/internal/$cmd" "$@"
