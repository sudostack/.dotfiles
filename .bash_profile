[ -f "$HOME/.bashrc" ] && source "$HOME/.bashrc"

HOMEBREW_PREFIX=$(brew --prefix)
if type brew &>/dev/null; then
  if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
    source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
  else
    for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
      [[ -r "$COMPLETION" ]] && source "$COMPLETION"
    done
  fi
fi

. /usr/local/opt/asdf/asdf.sh

. /usr/local/opt/asdf/etc/bash_completion.d/asdf.bash
