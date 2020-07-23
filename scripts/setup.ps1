if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

# Setup BitLocker

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Generic
choco install googlechrome vlc spotify dropbox putty.install qbittorrent steam firefox -y

# Work stuff
choco install zoom slack -y

# Dev stuff
choco install visualstudiocode git.install make powershell-core wsl2 wsl-ubuntu-1804 microsoft-windows-terminal docker-desktop -y
# Required: Manually make WSL available to non-admin users via:
# Navigate to (C:\ProgramData\chocolatey\lib\wsl-ubuntu-1804\tools\unzipped) and change the folder permissions to full control for "users"
# See also: https://github.com/microsoft/WSL/issues/5307#issuecomment-662925621

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

# Virtual dev stuff
# -------------------
choco install virtualbox vagrant -y
# -------------------

# Ruby dev stuff
# -------------------
# Setup devkit for 2.4+
# See also:
#   - https://chocolatey.org/packages/msys2
#   - https://github.com/oneclick/rubyinstaller2/wiki/FAQ
choco install ruby msys2 -y
refreshenv
powershell -executionpolicy bypass ridk install 2 3

# https://github.com/rubygems/rubygems/issues/2805
"gem: --no-document --platform=ruby" | Set-Content -Encoding utf8 $HOME\.gemrc

gem install bundler
bundle config --global jobs 3
# -------------------

Write-Host "`n`nPress any key to exit script ...";
$host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown") > $null; 
