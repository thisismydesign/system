# system

### Reproducible system setup

Made for Windows 10 and Ubuntu via WSL: a best-of-both-worlds choice.

## OS Install

Install Windows from a pendrive created with [Rufus](https://rufus.akeo.ie/) from the [official image](https://www.microsoft.com/software-download/windows10) or a custom one with updates integrated. BitLocker is not available on the Home version so it is recommended to install Windows 10 Pro or above.

## Setup & Customization

- Check for updates
- Turn on BitLocker (if your hardware doesn't support TPM [here's what to do](https://www.howtogeek.com/howto/6229/how-to-use-bitlocker-on-drives-without-tpm/))
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
- Customize quick access (pin e.g. `C:\Users\username`, `\\WSL$\Ubuntu-18.04`)
- Turn on Dark mode (once per account)

## App install

We'll use [Chocolatey](https://chocolatey.org/) from the command line to install apps. [Ninite](https://ninite.com/) is a nice graphical alternative.

To be able to execute scripts: open PowerShell (Start menu -> type `Windows PowerShell`) as an administrator and execute:
```powershell
Set-ExecutionPolicy RemoteSigned
```

Customize and execute the [install script](resources/setup.ps1):
```powershell
.\resources\setup.ps1
```

Customize
- `Startup Apps`
- `Default Apps`

## Benchmark

- Check Windows Experience Score: `Get-CimInstance Win32_WinSat`
- [Geekbench](https://www.geekbench.com/)
- [InSpectre](https://www.grc.com/inspectre.htm) to check if computer performance is affected by CPU vulnerability fixes. See also: https://support.microsoft.com/en-us/help/4073119/protect-against-speculative-execution-side-channel-vulnerabilities-in

## Ubuntu Setup & Customization

```sh
cp resources/.bash_aliases ~/.bash_aliases
```

## Scripts

- [`resources/.bash_aliases`](resources/.bash_aliases) Command aliases for Bash
- [`resources/disable-wake.ps1`](resources/disable-wake.ps1) Disable system wakes (updates during the night, random wakes of laptop in your bag, etc)
- [`resources/end-vr.ps1`](resources/end-vr.ps1) End the Oculus VR service that listens to the headset being used (or placed on a stand..)
- [`resources/lock.ps1`](resources/lock.ps1) Lock BitLocker drive
- [`resources/bash-functions.sh`](resources/bash-functions.sh) Bash functions
- [`resources/settings.json`](resources/settings.json) VSCode settings

## Notes
- `Windows Defender` is an antivirus app shipped with Windows, hence no antivirus installed
- Windows Defender Real-time projection causes performance issues with WSL: https://github.com/microsoft/WSL/issues/1932. You can consider turning it off.
