# Xbox Game Bar Config

<p align="center">
  <img src="https://img.shields.io/badge/Windows%2010-Game%20Bar-0078D4?style=flat-square&logo=windows" alt="Windows 10 Game Bar">
  <img src="https://img.shields.io/badge/GameDVR-Config-111111?style=flat-square" alt="GameDVR Config">
  <img src="https://img.shields.io/badge/60%20FPS-Supported-2EA44F?style=flat-square" alt="60 FPS">
  <img src="https://img.shields.io/github/license/tech-anupam/Xbox-Game-Bar-Config?style=flat-square" alt="License">
</p>

<p align="center">
  <b>Configure, repair and troubleshoot Xbox Game Bar recording from one menu.</b>
</p>

## What it does

- Enable Xbox Game Bar and Game DVR
- Force software encoding
- Request 60 FPS capture
- Set 720p, 1080p, 1440p or 4K capture
- Apply ready-made 1080p60, 1440p60 and 4K60 profiles
- Repair and re-register Xbox Game Bar
- Restart the Game DVR capture service
- Reset conservative capture settings
- Backup Game Bar registry settings
- Run GPU, DirectX, package and Game DVR diagnostics

## Quick start

1. Download `Xbox-Game-Bar-Config.bat`.
2. Right-click it.
3. Select `Run as administrator`.
4. Choose an option from the menu.
5. Restart Windows when requested.
6. Test `Win + G` or `Win + Alt + R`.

## Recommended profiles

| Profile | Resolution | FPS | Use |
|---|---:|---:|---|
| HD | 1280×720 | 60 | Low-end PCs |
| Full HD | 1920×1080 | 60 | Recommended |
| QHD | 2560×1440 | 60 | Higher-quality capture |
| 4K UHD | 3840×2160 | 60 | High CPU/GPU load |

Higher capture resolution does not create additional source detail. If the game renders at 1080p, recording at 1440p or 4K mainly upscales the frame.

## Fix common Game Bar problems

Use the menu instead of manually editing the registry.

`1` enables Game DVR.

`2` enables software encoding for systems where hardware capture is unavailable.

`3` requests 60 FPS.

`4` changes capture resolution.

`8` re-registers Xbox Game Bar and resets the Microsoft Store cache.

`9` restarts the Game DVR capture service.

`10` returns to conservative 720p30 settings.

`11` creates registry backups before experimentation.

`12` prints useful diagnostics.

## Compatibility

Designed for Windows 10 systems using Xbox Game Bar / Game DVR.

This project changes Windows GameDVR settings under:

`HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR`

and Game DVR policy under:

`HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR`.

Microsoft documents GameDVR configuration and the `AllowGameDVR` policy. The project does not replace Microsoft components or graphics drivers.

## Important

A registry setting cannot add hardware encoding capability to a GPU.

A requested 60 FPS or 1440p/4K profile can still be limited by Windows, Xbox Game Bar, the graphics driver, the encoder, the game, or system performance.

Software encoding can increase CPU usage.

Create a backup with option `11` before experimenting.

## Why this exists

Xbox Game Bar can expose limited capture options depending on the Windows version and graphics configuration. This utility provides a simple menu for the underlying GameDVR settings instead of requiring users to edit registry values manually.

## Keywords

Xbox Game Bar fix, Xbox Game Bar not recording, Game Bar 60 FPS, Xbox Game Bar 60 FPS, Windows Game DVR, Windows 10 screen recorder, Game DVR configuration, Game Bar capture settings, Game Bar hardware requirements, Xbox Game Bar graphics error, Game Bar recording resolution, 1080p60 Game Bar, 1440p60 Game Bar, 4K Game Bar, Game Bar software encoding, Xbox Game Bar repair, Windows gaming tools.

## Author

Built by [@tech-anupam](https://github.com/tech-anupam).

## Disclaimer

This is a Windows configuration utility. It modifies registry settings used by Game DVR. Use the backup option before changing advanced settings.

Microsoft controls Xbox Game Bar and Windows Game DVR. This project is not affiliated with Microsoft or Xbox.
