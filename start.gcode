; PrusaSlicer start gcode for Prusa i3 Mk3
; Last updated 20250704

; M300 S40 P10 ; chirp
M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M115 U3.9.0 ; tell printer latest fw version


M117 Initializing
; Set coordinate modes
G90 ; use absolute coordinates
M83 ; extruder relative mode
M84 S0 ; Disable stepper timeout


; Reset speed and extrusion rates
M200 D0 ; disable volumetric e
M220 S100 ; reset speed
M221 S100 ; reset extrusion rate


; Set initial warmup temps
M117 Preheat
M140 S[first_layer_bed_temperature] ; set bed final temp
; M104 S160 ; set extruder no-ooze temp
; M140 S{if printer_model=~/.*MK3S.*/}[first_layer_bed_temperature]{else}{max(first_layer_bed_temperature[0],80)}{endif}  ; set bed PINDA rmup temp
; Nozzle warmup before home to avoid driving hardened ooze into PEI surface
M104 S[first_layer_temperature] ; set extruder final temp


; Home
; M300 S40 P10 ; chirp
M117 Homing
G28 W ; home all without mesh bed level


; Present bed for final cleaning
; G0 Z3; Raise nozzle before move
; G0 X125 Y180 F10200; Move nozzle to PINDA warming position
; G0 Z0.15 F10200; Lower nozzle to PINDA warming position
; G0 Z3; Raise nozzle before move


; Mesh bed leveling
; M300 S40 P10 ; chirp
M117 Mesh bed leveling
G80 ; mesh bed leveling
M117 Saving results
G81 ; save mesh leveling results


; Final warmup routine
M117 Final warmup
G0 Z5; Raise nozzle to avoid denting bed while nozzle heats EDITED
M109 S[first_layer_temperature] ; wait for extruder final temp
M190 S[first_layer_bed_temperature] ; wait for bed final temp


; Nozzle cleaning EDITED
M300 S60 P10 ; chirp EDITED
M117 Clean nozzle
G1 Z50 F1800 ; move extruder above bed in front for easier cleaning EDITED
G4 P5000 ; Wait for 5 secs (5000ms) for cleaning EDITED
G0 Z5; Raise nozzle to avoid denting bed while nozzle heats EDITED


; Prime line routine
; M300 S40 P10 ; chirp
M117 Printing prime line
G0 Z0.15 ; Restore nozzle position - (thanks tim.m30)
M900 K0; Disable Linear Advance for prime line
G92 E0.0 ; reset extrusion distance

; G1 Y-3.0 X20 F1000.0 ; go outside print area
; G1 E2 F1000 ; de-retract and push ooze

; G1 X20.0 E6  F1000.0 ; fat 20mm intro line @ 0.30
; G1 X60.0 E3.2  F1000.0 ; thin +40mm intro line @ 0.08
; G1 X100.0 E6  F1000.0 ; fat +40mm intro line @ 0.15
; G1 E-0.8 F3000; retract to avoid stringing
; G1 X99.5 E0 F1000.0 ; -0.5mm wipe action to avoid string
; G1 X110.0 E0 F1000.0 ; +10mm intro line @ 0.00

; G1 E0.6 F1500; de-retract
; G92 E0.0 ; reset extrusion distance


G1 Y-3.0 X50 F2500.0

G1 E2 F1000 ; de-retract and push ooze

;G1 X20.0 E6  F1000.0 ; fat 20mm intro line @ 0.30
G1 X190.0 E25.0 F2000.0

;G1 X60.0 E3.2  F1000.0 ; thin +40mm intro line @ 0.08
G1 Y-2.3 F1000.0
G1 X50.0 E10 F2000.0

;G1 X100.0 E6  F1000.0 ; fat +40mm intro line @ 0.15
G1 Y-1.6 F1000.0
G1 X193.0 E20 F2000.0

G1 E-0.8 F3000; retract to avoid stringing
G1 X191.5 E0 F1000.0 ; -0.5mm wipe action to avoid string
G1 X200.0 E0 F1000.0 ; +10mm intro line @ 0.00
G1 E0.6 F1500; de-retract
G92 E0.0 ; reset extrusion distance


; Final print adjustments
; M300 S40 P10 ; chirp
M117 Preparing to print
; Adjust extrusion rate if desired
; M221 S{if layer_height >= 0.32}90{else}100{endif} ; compensate for thick layer heights
M117 Print in progress...