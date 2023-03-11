# mk3s-revo6-gcode
This is G-Code I've modified over time for my MK3S running with a Revo Six.

*Warning: I had an Ender 3 for a short time a couple years ago, then needed to pause from some of my funner hobbies. I've just now started diving into 3D printing again with an Prusa i3 MK3S. I don't fully understand G-Code, so please review any G-Code you use and proceed at your own risk.*

The Revo Six allows the end user to swap out nozzles by hand, which is quicker than grabbing some tools and bieng delicate as to not break the heatblock. Part of the instructions of doing so requires first that filemant be pulled back out of the nozzle's long shaft (yes that sounds dirty), and for the hotend to cool down to around 50C. Most often I found myself wanting to swap the nozzle far after a print has finished and the nozzle has already cooled without giving myself a chance to pull the filament back. Once the filament has cooled is both near imppossible and also setting yourself up for damage if you attempt to switch the nozzles at that point.

I've put together G-Code for the start, end, and cancellation scripts in order to make it much easier to enjoy the benifits of the Revo Six. Much of this started off from the default G-Code scripts provided by PrusaSlicer and OctoPrint, but then added in some fun stuff shared with by the awesome members of the [Prusa Discord server](https://discord.me/prusa3d) and other things I've found in the forums and Reddit.
