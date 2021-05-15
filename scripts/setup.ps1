if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

# Setup BitLocker

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Generic
choco install googlechrome vlc spotify dropbox putty.install qbittorrent steam firefox nordvpn -y

# Work stuff
choco install slack -y

# Dev stuff
choco install visualstudiocode git.install make powershell-core microsoft-windows-terminal docker-desktop -y

choco install wsl2 -y
# Required: Manually make WSL available to non-admin users via:
# Navigate to (C:\ProgramData\chocolatey\lib\wsl-ubuntu-1804\tools\unzipped) and change the folder permissions to full control for "users"
# See also: https://github.com/microsoft/WSL/issues/5307#issuecomment-662925621
wsl --set-default-version 2 # Follow instructions
choco install wsl-ubuntu-1804 -y
# To check WSL version run `docker` in the distro

# Generate SSH key
C:/"Program Files"/Git/git-bash -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
timeout 2
cat ~/.ssh/id_rsa.pub
# Upload public key from `~/.ssh` to GitHub: https://github.com/settings/keys
# Configure `git`
# - `git config --global user.email "you@example.com"`
# - `git config --global user.name "Your Name"`

# Refresh env at the end so you can use installations w/o terminal restart
# Nevertheless restart might still be required at this point ("The term 'xyz' is not recognized")
refreshenv

Write-Host "`n`nPress any key to exit script ...";
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null; 
