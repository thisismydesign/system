# OS
function echoerr() { echo "$@" 1>&2; }

function tmp-show-command(){
  xtrace="$(shopt -po xtrace)"
  set -o xtrace
  echo "Commands will be printed via 'set -o xtrace' then the option is reset"
  $xtrace
}

function no-wake(){
  # Disable wake devices (except for power button) (source: [1](https://ubuntu-mate.community/t/power-management-acpi-wake-up-settings/17344), [2](https://askubuntu.com/questions/148481/how-do-i-prevent-immediate-wake-up-from-suspend-and-or-hibernation))
  sudo sh -c "for i in $(cat /proc/acpi/wakeup|grep enabled|awk '{print $1}'|xargs); do [ $i != PBTN ] && echo $i|sudo tee /proc/acpi/wakeup;done"
}

# Kubernetes
function pods() {
  if [ -z "$1" ]; then
    echoerr "+ kubectl get pods"
    kubectl get pods
  else
    echoerr "+ kubectl --namespace=$1 get pods"
    kubectl --namespace=$1 get pods
  fi
}

function podgrep() {
  if [ -z "$1" ]; then echo 'No param given'; return; fi

  if [ -z "$2" ]; then
    echoerr "+ kubectl get pods | grep \"$1.*Running\" | sed -e 's/\s.*$//'"
    kubectl get pods | grep "$1.*Running" | sed -e 's/\s.*$//'
  else
    echoerr "kubectl --namespace=$2 get pods | grep \"$1.*Running\" | sed -e 's/\s.*$//'"
    kubectl --namespace=$2 get pods | grep "$1.*Running" | sed -e 's/\s.*$//'
  fi
}


# Docker
function drm() {
  if [ -z "$1" ]; then echo 'No param given'; return; fi

  echoerr "+ docker ps --all --filter name=^/\"$1\"$"
  docker ps --all --filter name=^/"$1"$

  echoerr "+ docker stop \"$1\""
  docker stop "$1"
  echoerr "+ docker rm \"$1\""
  docker rm "$1"

  echoerr "+ docker ps --all --filter name=^/\"$1\"$"
  docker ps --all --filter name=^/"$1"$
}
