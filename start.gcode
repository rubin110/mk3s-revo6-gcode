; https://github.com/rubin110/mk3s-revo6-gcode

M862.3 P "[printer_model]" ; printer model check
M862.1 P[nozzle_diameter] ; nozzle diameter check
M83 ; extruder relative mode
G90 ; use absolute coordinates

M104 S[first_layer_temperature] ; set extruder temp
M140 S[first_layer_bed_temperature] ; set bed temp

G28 W ; home all axes without mesh bed leveling

M109 S[first_layer_temperature] ; wait for extruder temp
G92 E0 ; reset extrusion distance
G1 E-2.0000 F1800 ; Retract 2mm to prevent oozing.
M190 S[first_layer_bed_temperature] ; wait for bed temp

G80 ; run mesh bed leveling routine
 
G1 Y-3.0 X50 Z0.3 F2500.0 ; Go outside print area for the start line
G92 E0.0 ; reset extrusion distance
G1 X200.0 E25.0 F1000.0 ; start line go right
G1 Y-2.3 F1000.0 ; start line go back
G1 Z0.20 F1000.0 ; start line get closer to the plate
G1 X50.0 E25 F1000.0 ; start line go left
G1 Y-1.6 F1000.0 ; start line go back
G1 X200.0 E30.0 F1000.0 ; start line go right
G1 E-0.1 F1800 ; Retract to prevent oozing
G1 X250.0 Z1 F2500.0 ; Move to corner of bed
G1 Z50 F1800 ; move extruder above bed in for cleaning
G4 P5000 ; Wait for 5 secs (5000ms) for cleaning
M221 S{if layer_height<0.075}100{else}95{endif} ; Set flow percentage
 
; Don't change E values below. Excessive value can damage the printer.
{if print_settings_id=~/.*(DETAIL @MK3|QUALITY @MK3).*/}M907 E430 ; set extruder motor current{endif}
{if print_settings_id=~/.*(SPEED @MK3|DRAFT @MK3).*/}M907 E538 ; set extruder motor current{endif}