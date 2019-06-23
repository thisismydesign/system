# Windows setup

## You'll need
- Working computer with internet access
- Software called [Rufus](https://rufus.akeo.ie/)
- Windows installer
- Pendrive

## Preparation
- Get a Windows image of your chosing. Easiest is the [official one](https://www.microsoft.com/software-download/windows10) but you might want to prefer one that has recent updates integrated.
- Use Rufus to create a bootable pendrive

## Installation
- Install Windows as usual (set boot device if needed, etc)
- Turn on BitLocker for your main drive (and possibly others as well). If your hardware doesn't support TPM [here's what to do](https://www.howtogeek.com/howto/6229/how-to-use-bitlocker-on-drives-without-tpm/).
- Update Windows if needed (`Check for udpates`)

We'll use [Chocolatey](https://chocolatey.org/) from the command line to install apps. [Ninite](https://ninite.com/) is a nice graphical alternative. Pro version ($1/mo) contains more apps.

Customize and execute:
```powershell
.\setup.ps1
```

## Setup
- Pin user folder to quick access: `C:\Users\username`
- Upload public key from `~/.ssh` to [GitHub](https://github.com/settings/keys)
- Configure `git`
  - `git config --global user.email "you@example.com"`
  - `git config --global user.name "Your Name"`

## Personalization
- Taskbar
  - `Taskbar settings`
    - Use peek: true, Location: lest, Combine: when full
    - Notification area: display all icons
  - Unpin IE, assistant
  - Pin Chrome on top
- Explorer
  - File -> Options -> View
    - Show hidden files
    - Untick hide extensions
- Power options
  - `Power & sleep settings` -> Additional power settings (on right)
    - Choose what power buttons do (on left) -> Change settings (on top)
      - Enable hibernate
      - All buttons to Hibernate
  - Change Balanced plan or create own
    - Turn off hard disk: never
    - Sleep -> Allow wake timers -> Disable

## Notes
- `Windows Defender` is an antivirus app shipped with Windows, hence no antivirus installed
- Code editors
  - Visual Studio Code > Atom > Sublime
  - VSCode has great git and terminal integration
  - All three is sufficiently fast and lightweight
- On the subject of operating systems:
  - Linux:
    - UX: moderate
    - OS: has issues, awful troubleshooting
    - 3rd party: no strong opinion
  - Mac:
    - UX: bad (Finder, Taskbar, Window handling)
    - OS: has issues
    - 3rd party: awful (e.g. TunnelBlick, NordVPN, Deluge, SourceTree don't go near these)
  - Windows:
    - UX: good
    - OS: has more issues, awful CLI support
    - 3rd party: better
  - Combo of my choice: Windows + virtual dev env (VirtualBox, Vagrant, Docker)
- If you have issues with Windows waking up by itself take a look at `disable_wakejobs.ps1` or [here for more options](https://superuser.com/q/973009/311688)
- If you want to lock other BitLocker drives without having C: encrypted take a look at `lock_d.ps1`
- If some native Ruby gems don't work try to reinstall them with `--platform=ruby` switch. E.g. `gem install eventmachine --platform=ruby`
