# Enhanced cat and less with syntax highlighting via oh-my-zsh colorize plugin.
# Uses colorized output when writing to an interactive terminal, falls back to standard utilities in pipes/redirects.
cat() {
  if [[ -t 1 && $# -gt 0 ]]; then
    ccat "$@"
  else
    command cat "$@"
  fi
}

less() {
  if [[ -t 1 && $# -gt 0 ]]; then
    cless "$@"
  else
    command less "$@"
  fi
}
