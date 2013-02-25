if [[ ! -o interactive ]]; then
    return
fi

compctl -K _cl cl

_cl() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(cl commands)"
  else
    completions="$(cl completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
