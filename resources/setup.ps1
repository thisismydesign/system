if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

# Setup BitLocker

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Generic
choco install googlechrome vlc spotify dropbox putty.install qbittorrent steam firefox f.lux -y

# Security & crypto
choco install tor-browser nordvpn electrum -y

# Work stuff
choco install slack -y

# Dev stuff
choco install visualstudiocode git.install make powershell-core microsoft-windows-terminal docker-desktop -y
# VSCode settings, in Windows:
# cp resources/settings.json %APPDATA%\Code\User\settings.json

# WSL
choco install wsl2 -y
wsl --set-default-version 2
choco install wsl-ubuntu-2004 -y
wsl -l -v
# Required setup steps:
# Run `Ubuntu` from start menu (skip creating user to use root)
# In Explorer go to \\wsl$
# Check if you can access WSL drive. If not, see issue & solution: https://github.com/microsoft/WSL/issues/5307#issuecomment-662925621

# For memory issue workaround: https://github.com/microsoft/WSL/issues/4166
# You can do `wsl --shutdown` from Windows to completely free memory
# Create %UserProfile%\.wslconfig: (from a Windows editor e.g. Notepad to have Windows line endings)
# [wsl2]
# memory=8GB
# swap=8GB

# Generate SSH key
C:/"Program Files"/Git/git-bash -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
timeout 2
cat ~/.ssh/id_rsa.pub

# Configure Git
# Upload public key from `~/.ssh` to GitHub: https://github.com/settings/keys
# Configure `git`
git config --global user.email ""
git config --global user.name ""

# Refresh env at the end so you can use installations w/o terminal restart
# Nevertheless restart might still be required at this point ("The term 'xyz' is not recognized")
refreshenv

Write-Host "`n`nPress any key to exit script ...";
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null; 
