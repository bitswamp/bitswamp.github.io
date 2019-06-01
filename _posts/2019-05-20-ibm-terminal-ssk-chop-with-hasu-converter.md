---
layout: post
title: IBM Terminal Model M chopped to SSK size with Hasu's TMK Converter
---

This is a placeholder post until I can add images.

converting a 103-key terminal model m to a "fake ssk"

references:
- https://geekhack.org/index.php?topic=27272.0
- https://deskthority.net/viewtopic.php?t=21198
- https://scrausch.blogspot.com/2015/01/making-model-m-ssk.html
- https://www.reddit.com/r/MechanicalKeyboards/comments/2ds4wv/cleaned_and_converted_a_terminal_model_m_into_usb/
- https://www.reddit.com/r/MechanicalKeyboards/comments/2mca1p/model_m_restoration_rust_removal_plastidip/
- https://freematics.com/pages/software/arduino-builder/

tools
- https://www.amazon.ca/gp/product/B00093GEJO/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1
- http://www.leevalley.com/en/wood/page.aspx?p=58686&cat=1,42884
- https://www.canadiantire.ca/en/pdp/j-b-weld-clear-weld-epoxy-syringe-25-ml-0383803p.html#srp

cutting down the case:
- remove the keycaps and unscrew the case screws
- measure and cut top case along each side of numpad
- measure and cut bottom case keeping flip foot and support rib (cut goes through rubber front foot hole; make sure the cut is the same width as the top plate)
- check pieces for fit
- sand, glue and clamp (used jb clear-weld epoxy)
- cut the 4th screw bracket from the junk section of top case
- glue screw bracket to new top case
- check top and bottom case for fit and alignment of screw holes
- trim sides of the leftmost/rightmost lock tabs on the top case if needed
- file down excess epoxy
- paint along the cut (?)

cutting the backplate and barrel plate:
- remove the rivets from the backplate and separate the pieces
- take a photo of the hammer positions
- remove the hammers and put them in a jar
- glue ribs of the barrel plate if they're cracking
- cut the steel backplate with a dremel
- cut the plastic barrel plate with a saw
- trim the rubber mat to match the barrel plate
- leave the membrane sheets intact, but snip the edges so they fold back easier
- drill a hole in the top right corner of the backplate to match the one in the top left (measure carefully)
- screw (/bolt) mod the barrel plate
- reassemble barrel plate, mat, membranes and backplate and screw (/bolt) them together

specific tmk changes for a 3.3V pro micro and iso layout:
- change cpu speed to 8mhz
- comment KEYMAP and uncomment KEYMAP_101
- add k13 and k53 codes to keymap in 2 places
- add NUHS and NUBS to keymap

compiling the tmk converter:
- download and install freematics arduino builder and mingw
- open mingw
- add freematics avr folder (containing avr-gcc.exe) to path if needed
- cd tmk_keyboard/converter/terminal_usb
- `make`

use teensy loader for teensy, use arduino builder for pro micro and follow steps:
- open freematics arduino builder
- load the .hex file
- plug in the pro micro
- click COM1
- when the message appears in the console, short the RESET pin to GND twice (to enter bootloader)
- a new COM port should be found and the .hex will be flashed
- if you get a timeout error (no new port found), try repeatedly

building the adapter:
- cut the original cable where it enters the case
- use the short end with the internal connector for the controller (set aside the long remaining piece of cable with the rj45 end)
- save the rubber cable guard for reuse
- identify the wires based on hasu's diagrams
- solder the 4 wires from the original cable end to the pro micro
- for a 3.3V pro micro, ensure to solder the 5V line from the keyboard to RAW instead of VCC
- i soldered the shield connector from the cable to pro micro GND, but this might not be necessary
- attach the pro micro to the keyboard controller
- either use a panel mount microusb extension or some kind of strain relief for the usb cable (or you'll damage either the usb port or the solder points on the pro micro)