if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) { Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`" `"$args`"" -Verb RunAs; exit }

# Setup BitLocker

# Install Chocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Generic
choco install googlechrome vlc spotify dropbox putty.install qbittorrent steam firefox -y

# Dev stuff
choco install slack visualstudiocode git.install make wsl2 wsl-ubuntu-1804 -y

# Generate SSH key
C:/"Program Files"/Git/git-bash -c "ssh-keygen -t rsa -N '' -f ~/.ssh/id_rsa"
timeout 2
cat ~/.ssh/id_rsa.pub

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
