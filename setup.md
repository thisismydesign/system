# Windows setup

Install Windows from a pendrive created with [Rufus](https://rufus.akeo.ie/) from the [official image](https://www.microsoft.com/software-download/windows10) or a custom one with updates integrated.

## Setup & Personalization

- Check for updates
- Turn on BitLocker (if your hardware doesn't support TPM [here's what to do](https://www.howtogeek.com/howto/6229/how-to-use-bitlocker-on-drives-without-tpm/))
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
  - Customize pins
- Explorer
  - File -> Change folder and search options -> View
    - Show hidden files
    - Untick hide extensions

## Install apps

We'll use [Chocolatey](https://chocolatey.org/) from the command line to install apps. [Ninite](https://ninite.com/) is a nice graphical alternative.

Customize and execute:
```powershell
.\scripts\setup.ps1
```

## Notes
- `Windows Defender` is an antivirus app shipped with Windows, hence no antivirus installed
- Windows Defender Real-time projection causes performance issues with WSL: https://github.com/microsoft/WSL/issues/1932. You can consider turning it off.
