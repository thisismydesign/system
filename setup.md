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
.\scripts\setup.ps1
```

## Setup & Personalization
- Turn on BitLocker on C:
- Customize quick access (pin e.g. `C:\Users\username`, `\\WSL$\Ubuntu-18.04`)
- Turn on Dark mode
- Adjust power, sleep and energy settings
  - `Power & sleep settings` -> Additional power settings (on right)
    - Choose what power buttons do (on left) -> Change settings (on top)
      - Enable hibernate
  - Change Balanced plan or create own
    - Turn off hard disk: never
    - Sleep -> Allow wake timers -> Disable
- Customize Taskbar
  - `Taskbar settings`
    - Use peek: true, Location: left, Combine: when full
    - Notification area: display all icons
  - Unpin IE, assistant
  - Pin populr apps (e.g. Chrome, Task Manager)
- Explorer
  - File -> Change folder and search options -> View
    - Show hidden files
    - Untick hide extensions

## Notes
- `Windows Defender` is an antivirus app shipped with Windows, hence no antivirus installed
