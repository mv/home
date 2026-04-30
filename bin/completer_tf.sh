


_fzf_complete_tf() {
  _fzf_complete --multi --reverse --prompt="tf> " -- "$@" < <(
    terraform  | awk '/^  / {print $1}' | sort
  )
}
