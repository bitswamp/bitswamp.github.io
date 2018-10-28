---
layout: post
title: Replacing the USB adapter for a Logitech Wingman Extreme Digital 3D joystick
---

After losing the original gameport-to-usb adapter for my Logitech joystick, I tried a 3rd party converter, found out that the joystick speaks USB natively, then replaced the joystick's cable with a direct wired USB cable. 

### References

* [https://sites.google.com/site/joystickrehab/itemcatal](https://sites.google.com/site/joystickrehab/itemcatal)
* [https://www.vogons.org/viewtopic.php?f=5&t=38555](https://www.vogons.org/viewtopic.php?f=5&t=38555)
* [https://www.descentbb.net/viewtopic.php?t=14791](https://www.descentbb.net/viewtopic.php?t=14791)
* [https://support.logitech.com/en_us/product/extreme-digital-3d/downloads](https://support.logitech.com/en_us/product/extreme-digital-3d/downloads)

### Preamble

When I went home to visit my family for Thanksgiving, Mom dug out a few boxes that had been packed away since I left for university. Among them was my Logitech Wingman Extreme Digital 3D. I knew it originally came with a USB adapter, but it was missing.

I thought it would be fun to set it up and play TIE Fighter again, before deciding whether to keep or toss it. I knew I needed to replace the USB adapter.

### Buying a Mayflash adapter - didn't work

I bought a Mayflash Super Joy Box 7 gameport-to-usb adapter from amazon.com (US site). Joystick Rehab's description said "Mode S - Logitech ADI Joystick (for Logitech Wingman Digital, and Logitech Wingman Extreme Digital)" and I didn't notice the name didn't include "3D". Plugging it in resulted in the adapter being detected fine by Windows, but not behaving like a joystick was actually attached to it.

### Learning the joystick spoke USB

Reading the section "Later Digital Joysticks" of [https://sites.google.com/site/joystickrehab/analog-vs-digital](https://sites.google.com/site/joystickrehab/analog-vs-digital) made me realize that the joystick's original adapter might have been passive - no protocol adaptation required. If that was true, I could build a new adapter.

With Google I found the [forum post at vogons.org](https://www.vogons.org/viewtopic.php?f=5&t=38555), which helpfully [linked to descentbb.net](https://www.descentbb.net/viewtopic.php?t=14791). This included all the pinout information required to build the adapter. 

### Other options

The original USB adapter would have worked fine if I still had it. 

Buying the Belkin adapter (advertised as for a Sidewinder) ought to work, according to [https://www.descentbb.net/viewtopic.php?t=14791](https://www.descentbb.net/viewtopic.php?t=14791) (though you may have to short pins 2 and 7 yourself).

### External or internal conversion

If I had a gameport cable in one of my project boxes, I likely would have built an external adapter to replace the original. Since I didn't, I decided to replace the built in gameport cable with a USB cable.

### Disassembling the joystick

1 video and 1 forum link?

### Replacing the cable

I had a Logitech USB mouse in my box of electronics-to-be-recycled. I opened it and removed the USB cable. Conveniently, its cable colours matched the internal end of the existing gameport cable (black - shield, black - ground, red, white, green). I removed each wire of both cables from its white plastic connector/terminator. Then I inserted the five wires of the mouse cable into the 8-pin connector end from the joystick in the same order as the original cable by colour..

In order to short pins 2 and 7, I found another cable with a similar connector -- attached to a small fan I didn't intend to use -- removed 2 wires from it, stripped and soldered the wire ends together, and inserted the other ends in positions 6 and 7 in the 8-pin connector.

The 8th socket in the white connector does not need to be populated with anything, even though it was attached to the gray wire in the original gameport cable.

### Reassembling the joystick

keeping the buttons in the handle, keeping the rudder spring in place, making sure the throttle is in the right place, 

### Results

detected by windows, joystick tester, logitech drivers
