; https://github.com/rubin110/mk3s-revo6-gcode

G91 ; set to Relative position
G1 E-1 F300 ; retract filament a bit before lifting nozzle
G0 Z15 ; move z axis up 15mm
G90 ; set to Absolute position
G1 Y210 X0 F5000 ; move part out for inspection
G1 E-30 F300 ; retract filament to allow nozzle swap after cooldown

M84 ; disable motors

; OctoPrint specific, disable all heaters
{% snippet 'disable_hotends' %}
{% snippet 'disable_bed' %}

M106 S0 ; disable fan