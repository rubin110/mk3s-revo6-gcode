# G-Code for the Prusa i3 MK3S and Revo Six

<center><img src="https://github.com/rubin110/mk3s-revo6-gcode/blob/main/images/mk3s.jpg?raw=trueg" height="200"><img src="https://github.com/rubin110/mk3s-revo6-gcode/blob/main/images/revosix.jpg?raw=true" height="200"></center><br>

This is quality of life G-Code I've modified over time for my [Prusa i3 MK3S}(https://www.prusa3d.com/category/original-prusa-i3-mk3s/) running with E3D [Revo Six](https://e3d-online.com/products/revo-six). I have a MK3S+ but I believe this should also work with a MK3S.

## Warning
I had an Ender 3 for a short time a couple years ago, then needed to pause from some of my funner hobbies. I've just now started diving into 3D printing again with an Prusa i3 MK3S. I don't fully understand G-Code, so please review any G-Code you use and **proceed at your own risk**. I am not affiliated with Prusa or E3D, and nothing linked from this page will provide me with any affiliate kickback.

## The problem
In order to complete a swap of the Revo Six nozzles, you need to both pull filament out of the nozzle, and also wait for things to cool down to 50C. Most of the time when I've wanted to swap the nozzle it's after a print is done and the nozzle has fully cooled, so I would need to reheat the hot end, pull the filament, then wait again for another cool down before I can do a nozzle swap. The amount of time spent on this in my opinion defeats the purpose of having these quick swap nozzles.

## My solution
I've cobbled together G-Code for the start, end, and cancellation scripts to easier enjoy the benefits of the Revo Six without the need to reheat. I started off with the default scripts from [PrusaSlicer](https://www.prusa3d.com/prusaslicer/), E3D's own [nozzle change documentation](https://e3d-online.zendesk.com/hc/en-us/articles/4406857421213-Start-and-End-G-code-for-faster-nozzle-changes), and [OctoPrint](https://octoprint.org/). Added in some fun stuff shared by the awesome members of the [Prusa Discord server](https://discord.me/prusa3d), [Prusa community forums](https://forum.prusa3d.com/) and [Reddit](https://www.reddit.com/r/prusa3d/).

## The quality of life goals of this G-Code are to:
### End a print or canceling a print:
* Retract the filament just enough to clear the nozzle.
    * Swapping of nozzle can now happen once the printer has cooled down naturally after the end of a print.
    * Skipping the "Load filament" option by keeping it engaged with the extruder motor gears. Just start your next print (regardless of if you swap nozzles or not).
    * Disable the extruder motor so it's possible to manually (slowly) pull up on the filament that's not attached to the nozzle (regardless of if you swap nozzles or not).
### Start of print:
* Starting line:
    * Extra long triple starting line to compensate for how far the filament has been retracted from the nozzle.
    * Start line doesn't go fully to the corners of the build plate as the MK3S has a known issue of [5C drop at the corners of the bed](https://youtu.be/2sW25xt5E6U?t=697), this prevents the starting line from getting dragged away with the nozzle.
* Pull up and wait 5 seconds for nozzle wipe, gives you a chance to clean the nozzle (nose blowing) with a wire brush.

## How to use
*Repeating the warning from above, I am no expert at G-Code. Please review and understand all of the G-Code you're using before you send it off to your printer. Proceed at your own risk.*

You will need to copy and paste the scripts provided into the software you use to generate the G-Code, please see the documentation for the software you use on how to accomplish this. Keep in mind that if you stop the print from the LCD menu of the printer, no extra retraction will happen.

## Extra stuff
One of the wires for my Revo Six broke off at the connector. E3D was kind enough to replace it and also linked me to this [connector clip part](https://www.printables.com/model/275040-connector-clips-for-heatercore-wiring). It really does help but is bulky. I recently found this [more elegant cable duct part](https://www.printables.com/model/139656-prusa-i3-mk3-x-axis-cable-holder-roomy-revo-editio) but haven't gotten around to printing and trying it out.

I really like this [threaded Revo Six nozzle holder](https://www.printables.com/model/256297-threaded-revo-6-nozzle-holder).

## Good luck!

<center><img src="https://github.com/rubin110/mk3s-revo6-gcode/blob/main/images/goodluck.png?raw=true" height="300"></center>