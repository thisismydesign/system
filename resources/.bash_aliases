# Conventions
# - always print the full command

# OS
alias r="alias r; cd ."
alias e="alias e; export"
alias ports="alias ports; sudo lsof -i -P -n | grep LISTEN"
alias disk="alias disk; df -h --total | grep total"

# Wake related stuff for native Ubuntu, not for WSL
# alias nowake="alias nowake; for i in $(cat /proc/acpi/wakeup|grep enabled|awk '{print $1}'|xargs); do [ $i != PBTN ] && echo $i|sudo tee /proc/acpi/wakeup;done"
# alias wakeup="alias wakeup; cat /proc/acpi/wakeup"

# Git
alias gc="alias gc; git checkout"
alias gp="alias gp; git pull"
alias gm="alias gm; git merge"

# VSCode
alias vei="alias vei; cat .vscode/extensions.json | jq '.recommendations[]' | xargs -l code --install-extension"

# Docker
alias dc="alias dc; docker-compose"
alias dcu="alias dcu; docker-compose up"
alias dcur="alias dcur; docker-compose up --force-recreate --build"
alias dp="alias dp; docker system prune --all --force --volumes"
alias ddf="alias ddf; docker system df"
alias dpsa="alias dpsa; docker ps -a"

# Ruby
alias b="alias b; bundle"
alias ber="alias ber; bundle exec rspec"
alias be="alias be; bundle exec"
alias bera="alias bera; bundle exec rubocop -A"

# Kubernetes
alias k="alias k; kubectl "
alias hda="alias hda; helm list --all --short | xargs -L1 helm delete --purge"

# WSL
alias fm="alias fm; echo 1 > /proc/sys/vm/drop_caches" # https://devblogs.microsoft.com/commandline/memory-reclaim-in-the-windows-subsystem-for-linux-2/
alias fmm="alias fmm; sync && echo 3 > /proc/sys/vm/drop_caches" # https://github.com/microsoft/WSL/issues/4166#issuecomment-570913524
