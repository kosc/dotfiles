export EDITOR=vim

set -o vi

mycd () {
  cd $1;
  # Activate local environment variables if exists
  if [ -f .local/vars.sh ]; then
    source .local/vars.sh;
  fi
  # Activate virtual env if exists
  if [ -f .venv/bin/activate ]; then
    source .venv/bin/activate;
  fi
}

alias cd=mycd
