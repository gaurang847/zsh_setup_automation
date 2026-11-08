# Display quote on opening a new terminal.
# Command available from custom rand-quote plugin
if typeset -f quote > /dev/null 2>&1; then
  quote
fi
