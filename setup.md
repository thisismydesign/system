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
