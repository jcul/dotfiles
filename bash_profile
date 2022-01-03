# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc

if [ -z "${DISPLAY}" ] && [ "$(fgconsole 2>/dev/null || echo -1)" -eq 1 ]; then
  exec startx
fi

