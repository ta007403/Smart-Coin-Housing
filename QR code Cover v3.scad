// ==== Scanner parameters ====
scanner_w = 120;        // Width
scanner_h = 120;        // Height

plate_w = 100;        // Width
plate_h = 100;        // Height
plate_thick = 10;        // Plate thickness

//scanner_d = 100;         // Depth
tab_offset = 7;         // Distance from edge to tab center (estimate! Measure yours if you can)
tab_dia = 3.6;          // Mounting hole diameter (estimate! Use caliper if you have one)
mount_dia = 3.2;

ear_space = 20;

win_w = 61.4;             // Window width (measure the actual glass if possible)
win_h = 51.4;             // Window height (measure the actual glass if possible)
window_position_x = (plate_w - win_w) / 2;
window_position_y = ((plate_w - (win_h + ear_space)) / 2) + (ear_space / 2);

corner_radius = 4;      // <<<----- Set your desired corner radius here

inner_close = 3.5;
outer_close = 10;

difference() {
    // --- Main plate ---
    cube([plate_w, plate_h, plate_thick]);
    
    // --- Main plate with rounded corners using minkowski() ---
    translate([window_position_x + corner_radius, window_position_y + corner_radius, -1])
        minkowski() {
            cube([win_w - (2 * corner_radius), win_h - (2 * corner_radius), plate_thick + 2]);
            cylinder(r = corner_radius, h = plate_thick, $fn = 40);
        }
    
    // --- Cut 1 depth step ---
    translate([(plate_w - win_w) / 2, (plate_w - (win_h + ear_space)) / 2, 5])
       cube([win_w, win_h + ear_space, plate_thick]);
    
    // --- Mounting holes (4 inner) ---
    translate([window_position_x + 8.5, window_position_y - inner_close, -1])
        cylinder(d = tab_dia, h = plate_thick + 99, $fn = 30);
    translate([window_position_x + win_w  - 8.5, window_position_y - inner_close, -1])
        cylinder(d = tab_dia, h = plate_thick + 99, $fn = 30);
    translate([window_position_x + 8.5, window_position_y + win_h + inner_close, -1])
        cylinder(d = tab_dia, h = plate_thick + 99, $fn = 30);
    translate([window_position_x + win_w  - 8.5, window_position_y + win_h + inner_close, -1])
        cylinder(d = tab_dia, h = plate_thick + 99, $fn = 30);

    // --- Mounting holes (4 outer corners) ---
    translate([outer_close, outer_close, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
    translate([plate_w - outer_close, outer_close, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
    translate([outer_close, plate_w - outer_close, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
    translate([plate_w - outer_close, plate_w - outer_close, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
}
