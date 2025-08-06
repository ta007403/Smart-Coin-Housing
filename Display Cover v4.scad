// Parameters
pcb_x = 165;
pcb_y = 102;
frame_thick = 9;

wing = 60;          // width of 1st step (main wing)
wing_padding = 20;
step_thick = 3;      // thickness of 2nd step (outer wing)

// Calculate window and hole as before
lcd_x = 155;
lcd_y = 87;

hole_dia = 3.2;
tap_dia = 3.6;

creep_depth = 2.5;

washer_thickness = 1.5;
washer_z_position = -washer_thickness;
washer_outer_dia = tap_dia + 4;  // Adjust this as needed
washer_inner_dia = tap_dia;

difference() {
    // --- Outer Step (wing2) ---
    cube([pcb_x + wing, pcb_y + wing, frame_thick]);
    
    // --- Outer Mounting holes ---
    translate([10, 10, -1])
        cylinder(d=hole_dia, h=50, $fn=30);
    translate([pcb_x + wing - 10, 10, -1])
        cylinder(d=hole_dia, h=50, $fn=30);
    translate([10, pcb_y + wing - 10, -1])
        cylinder(d=hole_dia, h=50, $fn=30);
    translate([pcb_x + wing - 10, pcb_y + wing - 10, -1])
        cylinder(d=hole_dia, h=50, $fn=30);
    
    translate([10, 10, 0])
    {
        // --- LCD cutout ---
        translate([20, 20, -1])
            cube([pcb_x, pcb_y, frame_thick + 2]);

        // --- Inner Step (wing1) ---
        //translate([20, 6, 3])
        //    cube([pcb_x, 130, frame_thick]);

        // --- Inner Mounting holes ---
        translate([wing_padding + 4, pcb_y + wing_padding + 6, -1])
            cylinder(d=tap_dia, h=50, $fn=30);
        translate([pcb_x + wing_padding - 4, pcb_y + wing_padding + 6, -1])
            cylinder(d=tap_dia, h=50, $fn=30);
        translate([wing_padding + 4, (pcb_y + wing_padding) - 109, -1])
            cylinder(d=tap_dia, h=50, $fn=30);
        translate([pcb_x + wing_padding - 4, (pcb_y + wing_padding) - 109, -1])
            cylinder(d=tap_dia, h=50, $fn=30);
    }
}

translate([10, 10, 0])
{
    washer([wing_padding + 4, pcb_y + wing_padding + 6, washer_z_position]);
    washer([pcb_x + wing_padding - 4, pcb_y + wing_padding + 6, washer_z_position]);
    washer([wing_padding + 4, (pcb_y + wing_padding) - 109, washer_z_position]);
    washer([pcb_x + wing_padding - 4, (pcb_y + wing_padding) - 109, washer_z_position]);
}

// Left Creep
translate([30, 30, frame_thick - creep_depth])
    cube([2.5, pcb_y, creep_depth]);

// Right Creep
translate([30 + 159, 30, frame_thick - creep_depth])
    cube([6.5, pcb_y, creep_depth]);

// Upper Creep
translate([30, 29 + 100, frame_thick - creep_depth])
    cube([pcb_x, 3.5, creep_depth]);

// Lower Creep
translate([30, 30, frame_thick - creep_depth])
    cube([pcb_x, 10.5, creep_depth]);

module washer(pos) {
    translate([pos[0], pos[1], pos[2]])
        difference() {
            cylinder(d=washer_outer_dia, h=washer_thickness, $fn=60);
            translate([0,0,-0.1])  // slight offset to avoid z-fighting
                cylinder(d=washer_inner_dia, h=washer_thickness + 0.2, $fn=60);
        }
}