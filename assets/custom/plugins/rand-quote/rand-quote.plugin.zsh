if ! (( $+commands[curl] )); then
  echo "rand-quote plugin needs curl to work" >&2
  return
fi

function quote {
  setopt localoptions nopromptsubst

  # Ensure curl is available
  (( $+commands[curl] )) || return 0

  # Get random quote data (with strict timeout to never block terminal startup)
  local data
  data="$(command curl -fsS --connect-timeout 1 --max-time 2 "https://www.quotationspage.com/random.php?number=1&collection[]=mgm&collection[]=motivate" \
    | iconv -c -f ISO-8859-1 -t UTF-8 2>/dev/null \
    | command grep -a -m 1 'dt class="quote"')"

  # Exit silently if could not fetch random quote (e.g. offline or timeout)
  [[ -n "$data" ]] || return 0

  local quote author
  quote=$(sed -e 's|</dt>.*||g' -e 's|.*html||g' -e 's|^[^a-zA-Z]*||' -e 's|</a..*$||g' <<< "$data")
  author=$(sed -e 's|.*/quotes/||g' -e 's|<.*||g' -e 's|.*">||g' <<< "$data")

  print -P "%F{3}${author}%f: “%F{5}${quote}%f”"
}
