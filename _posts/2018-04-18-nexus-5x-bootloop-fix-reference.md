---
layout: post
title: Nexus 5X bootloop fix reference
---

Cataloguing the steps I took to fix my Nexus 5X stuck in a boot loop.

### References:

* [https://www.xda-developers.com/nexus-5x-bootloop-fix-boot-phone/](https://www.xda-developers.com/nexus-5x-bootloop-fix-boot-phone/)
* [https://forum.xda-developers.com/nexus-5x/general/untested-nexus-5x-bootloop-death-fix-t3641199](https://forum.xda-developers.com/nexus-5x/general/untested-nexus-5x-bootloop-death-fix-t3641199)
* [https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2](https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2)

### Starting condition:

I had previously unlocked the bootloader on the Nexus 5X, enabled usb debugging, and installed the usb driver on Windows. I could successfully boot to the bootloader (pwr + vol down). Trying to power on the phone normally resulted in a normal boot, then the phone would restart itself (boot loop, well-known issue for this phone).

### First try (failure):

Followed the steps in [https://www.xda-developers.com/nexus-5x-bootloop-fix-boot-phone/](https://www.xda-developers.com/nexus-5x-bootloop-fix-boot-phone/), including downloading the latest adb/fastboot platform tools from Google (I didn't put them in my `PATH`). Flashed the linked boot image and rebooted the phone.

This stopped the boot loop, but caused the phone to stay on the Google logo after a reboot (30+ minutes).

### Second try (failure):

Downloaded the February/March 2018 boot images from [https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2](https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2) and tried flashing one, then the other.

In both cases, this allowed the phone to proceed past the Google logo, but caused it to hang on the Android boot animation (30+ minutes). 

Booting to the bootloader still worked, but trying to access recovery from the menu resulted in the Google logo followed by a reboot/normal boot attempt. I couldn't access any recovery screens.

### Third try (success -- but wipes apps and user data):

Downloaded all 3 images for the March 2018 build from [https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2](https://forum.xda-developers.com/showpost.php?p=74041715&postcount=2) (4 core boot, 4 core recovery and full system -- build opm3.171019.016).

Extracted the contents of the full image zip. Modified `flash_all.bat` so that the `PATH` included location of the `platform_tools` dir with adb/fastboot.

<span style="color: red;">This will wipe your phone. Don't do it if you have data you need to save.</span>

Ran the following commands from a Powershell prompt and waited for each to complete:
```
.\flash_all.bat # run from the extracted system image dir
.\fastboot.exe flash boot boot-4core-bullhead-opm3.171019.016.img # from platform_tools dir 
.\fastboot.exe flash recovery recovery-4core-bullhead-opm3.171019.016.img
.\fastboot.exe reboot
```

After this, I used pwr + vol down to reboot into the bootloader again and tried to access recovery. This succeeded, so as a precaution I cleared the phone's cache via recovery. Then I rebooted normally. 

The phone booted successfully and prompted me for my Google account info. I was able to log in with sms verification as my 2FA method.
