; CANCEL
; Last edited 20200215

G4 ; wait
; Raise nozzle and present bed
M117 Safely ending print
G4 ; wait

; Anti-stringing end wiggle
G91 ; use relative coordinates
G1 E-0.8 F3000; retract to avoid stringing
G1 Z5 F2400 ;Retract and raise Z# EDITED

G90 ; use absolute coordinates
G0 X0 Y210 F3600; present bed
G1 E-4 F2700 ;Retract a bit EDITED
G1 E-26 F800 ;retract filament from meltzone for Revo6 EDITED

; Reset print setting overrides
M200 D0 ; disable volumetric e
M220 S100 ; reset speed factor to 100%
M221 S100 ; reset extruder factor to 100%
M900 K0 ; reset linear acceleration
; Shut down printer
M104 S0 ; turn off temperature
M140 S0 ; turn off heatbed
M107 ; turn off fan
M84 ; disable motors
M300 S40 P10 ; chirp