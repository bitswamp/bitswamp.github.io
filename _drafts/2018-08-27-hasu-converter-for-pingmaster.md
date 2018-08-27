---
layout: post
title: Internal Hasu's converter for IBM 6113442 keyboard
---

Building a reversible, internal USB converter for the IBM 6113442 "Pingmaster" with a Teensy 2.0 and Hasu's TMK firmware.


### Necessary equipment

- teensy 2.0 (or pro micro)
- mini usb cable
- floppy disk power connector
- two 1kOhm resistors
- soldering tools
- screwdriver - philips head


### Nice to have

- teensy 2.0 with header pins
- breadboard


### References

- https://geekhack.org/index.php?topic=54706.0
- https://github.com/tmk/tmk_keyboard/tree/master/converter/ibm4704_usb
- https://deskthority.net/post366609.html?sid=7a2baf4f648e5a8125e402d8e2671415#p366609
- https://www.pjrc.com/teensy/loader.html
- http://www.tmk-kbd.com/tmk_keyboard/editor/unimap/?ibm4704_usb_rev1_alps


### Open the keyboard and remove the original cable

When removing screws, make sure to put them in a tray/dish so you don't lose them.

- Flip the keyboard upside down and remove the four screws
- Flip the keyboard right side up, slide the top plate forward, and lift from the rear
- Remove two screws:
  - Screw securing the cable
  - Screw connecting the cable's shield ground to the keyboard plate
- Disconnect and remove the cable


### Prepare the floppy power connector

- Test to ensure the connector you have fits on the keyboard's internal header (4 pins)
- Cut the connector leaving 3-6 inches of wire attached to the header
- Strip about 0.5 inches from the end of each of the 4 wires


### Prepare the keyboard controller

- Visit http://www.tmk-kbd.com/tmk_keyboard/editor/unimap/?ibm4704_usb_rev1_alps and customize the layout as desired
- Download the output .hex file
- Use teensy loader to write .hex file to teensy board


### (Optional) Test on a breadboard

- If you have a breadboard-compatible teensy, plug it in to your breadboard
- Add pullup resistors:
  - 1k between Vcc and Data (PD0 on the teensy)
  - 1k between Vcc and Clock (PD1 on the teensy)
- Plug the floppy power cable into your keyboard
- Plug the wires from the power cable into your breadboard
- When looking at the keyboard from the normal orientation, the pinout of the cable header is:
  - Pin 1 (top): Clock - connect to teensy PD1
  - Pin 2: Data - connect to teensy PD0
  - Pin 3: Ground - connect to teensy ground
  - Pin 4 (bottom): 5V Power - connect to teensy Vcc
- Attach the usb cable from computer to teensy

It will take up to 10 seconds before the keyboard becomes available. 

An easy way to test if the keyboard is receiving power and working is to increase the volume of the beeper. If pressing keys produces beeps, then the board is powered on and working. If there are no beeps then there may be a problem with the beeper, the keyboard, or the converter.


### Solder the converter


### Troubleshooting

- double check the 