# Description
ElevenTray is a privacy-respecting and lightweight utility for Windows 11 that ensures all system tray icons are always visible. Frustratingly, Microsoft decided to hide system tray icons by default in Windows 11, and removed the option for *"Always show all icons in the notification area."* Previous workarounds, such as using `explorer shell:::{05d7b0f4-2121-4eff-bf6b-ed3f69b894d9}` to access this setting, no longer work.

Simply install ElevenTray, and it will silently run in the background, ensuring ALL system tray icons stay visible.

# Features
* No trackers or telemetry.
* Monitors the registry for hidden system tray icons and automatically reveals them.
* Runs as a background process (`ElevenTray.exe`).
* Logs actions and events to `C:\Program Files\ElevenTray\ElevenTray.log` (default installation location).

# System Requirements
* **Operating System**: Windows 11
* **Build**: 10.0.22000 or higher

# Installation
* Download the latest version of the installer from the [Releases](https://github.com/locksec/eleventray/releases) section.
* Run the installer and follow the on-screen instructions.
* Once installed, ElevenTray will automatically start and ensure that all tray icons remain visible. You'll see `ElevenTray.exe` running in Task Manager.

# Uninstallation
1. Right-click the Start menu > Installed Apps.
2. Select ElevenTray and choose Uninstall.

# Security & Privacy
This is open-source software, so feel free to check out the code. There are no trackers, telemetry, outbound connections, or other privacy-invasive tactics. If you prefer, you can compile the software yourself using the installer, which employs [Inno Setup](https://jrsoftware.org/isinfo.php). The Inno Setup script (`setup.iss`) is included for your convenience.

## GPG Signature
To verify the authenticity of the release, use the GPG signature provided and follow these steps:

1. Download both the installer (`elevensetup.exe`) and the corresponding GPG signature file (`elevensetup.exe.sig`).
2. Import my GPG public key (see below).
3. Verify the installer using the following command: `gpg --verify elevensetup.exe.sig elevensetup.exe`.

### Importing my GPG Public Key
* **Public Key**: [pubkey.asc](https://lockdown.media/gpg/pubkey.asc)
* **Key ID**: B802D40CF0C5ACA2
* **Subkeys**: 482532A2A469C7A7
* **Fingerprint**: 63D5A147B9A4E750F620E548B802D40CF0C5ACA2

Use: `gpg --recv-keys 63D5A147B9A4E750F620E548B802D40CF0C5ACA2`

or import with: `gpg --import path/to/public-key.asc`

# Donate
If you find ElevenTray useful and would like to support its development, consider becoming a [Patreon member](https://www.patreon.com/TheLockdown). I also host [The Lockdown - Practical Privacy & Security](https://lockdown.media/podcast/) podcast. My Patreon members help support projects such as this and the show, but of course, it is entirely optional. Privacy is a human right, and I'm just trying to keep it that way.

# License
ElevenTray is open-source software licensed under the GNU General Public License v3.0. See the LICENSE file for more details.