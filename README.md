# Dark Mine

A first-person mining game in pitch-dark caves. Mine ore to power the lift and ride it down through three depths. The creatures are **blind** and hunt by **sound**: every step, swing and ping can bring them to you.

Made by Jackson Pike for CS 458.

## Install

**Mac** (Intel or Apple Silicon). Paste into Terminal:

```bash
curl -fsSL https://raw.githubusercontent.com/Jackson-Pike/homebrew-dark-mine/main/install.sh | bash
```

**Windows** (64-bit). Paste into PowerShell:

```powershell
irm https://raw.githubusercontent.com/Jackson-Pike/homebrew-dark-mine/main/install.ps1 | iex
```

**Homebrew**:

```bash
brew install --cask jackson-pike/dark-mine/dark-mine
```

Running the same command again updates to the newest version.

## Or download it yourself

Grab the latest from [Releases](https://github.com/Jackson-Pike/homebrew-dark-mine/releases/latest):

- **Mac:** `DarkMine-Mac.dmg`. Open it and drag Dark Mine into Applications. The first time, macOS will say it can't check the app for malware, because it isn't signed with a paid Apple developer account. Click **Done**, then go to **System Settings → Privacy & Security**, scroll down and click **Open Anyway**.
- **Windows:** `DarkMine-Windows.zip`. Unzip it and run `Dark Mine.exe` from the `Dark Mine` folder. If SmartScreen appears, click **More info → Run anyway**.

(The one-line installers skip both of these warnings.)

## Controls

| | |
|---|---|
| Move | WASD |
| Look | Mouse |
| Dig | Left mouse (hold) |
| Ping (see for a moment, but it's loud) | Q or right mouse |
| Crawl (quiet) | C |
| Throw a rock (lure creatures away) | G |
| Jump | Space |
| Bigger map | M |
| Pause | Esc |

## Uninstall

- **Mac:** delete `~/Applications/Dark Mine.app` (or `brew uninstall --cask dark-mine`).
- **Windows:** delete `%LOCALAPPDATA%\Programs\Dark Mine` and the Dark Mine Start Menu shortcut.
