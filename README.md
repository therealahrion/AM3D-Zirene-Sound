# JamesDSPManager for AudModLib
This module enables JamesDSPManager.

### Dependencies
* [Audio Modification Library](https://forum.xda-developers.com/apps/magisk/module-audio-modification-library-t3579612) @ XDA Developers

## Compatibility
* Android Jellybean+
* init.d (LineageOS SU, phh's SU, & rootless)
* MagiskSU & SuperSU
* Magisk & System install
* Nexus/Pixel support (A/B OTA)
* SELinix enforcing (LOS SU & rootless need permissive)
* Works with [AM3D Zirene Sound](https://forum.xda-developers.com/android/apps-games/mod-zirene-sound-am3d-t3396698/post71580634#post71580634), [Dolby Atmos](https://github.com/therealahrion/Dolby-Atmos-ZTE-Axon-7) & ViPER4Android [FX](https://forum.xda-developers.com/apps/magisk/module-viper4android-fx-2-5-0-5-t3577058)/XHiFi

## Change Log
v1.0 (2017-10-11)
* Based on JamesDSPManager Oct 11, 2017 build "High efficient convolution engine and Better linear phase bass boost"
* Unity/AML v2.1: Updated for Magisk v14.2
* Unity/AML v2.1: Updated to Magisk module template 1410
* Unity/AML v2.1: Silently uninstall previous version before new version upgrades (this is to keep every upgrade install clean in cases where the new version doesnt include files the previous version may have included)
* Unity/AML v2.1: Further A/B OTA (Pixel family) improvements
* Unity/AML v2.1: System backup/restore fully automated (no need to manually write files to INFO file anymore)
* Unity/AML v2.1: Added cabability for modifications to modify /data partition
* Unity/AML v2.1: Added "minVer" (an internal check that should always be equal to the latest stable Magisk release in cases where the template is based off of a beta release)
* Unity/AML v2.1: Added support for SuperSU BINDSBIN mode
* Unity/AML v2.1: Fix cache system installs
* Unity/AML v2.1: Moved scripts to post-fs-data for Magisk installs (fixes some issues such as AM3D white screen on compatible devices)
* Unity/AML v2.1: Fixed System override issues some were facing
* Unity/AML v2.1: Fixed System install partition re-mounting
* Unity/AML v2.1: Updated Instructions (for developers only)
* Unity/AML v2.1: Various script fixes and improvements

## Credits
* [james34602 - creator of JamesDSPManager](https://github.com/james34602/JamesDSPManager)
* [ahrion, Zackptg5 - creators of Unity Installer & Audio Modification Library](https://forum.xda-developers.com/apps/magisk/module-audio-modification-library-t3579612)

## Forked From
* AM3D Zirene Sound Module [GitHub](https://github.com/therealahrion/AM3D-Zirene-Sound)
