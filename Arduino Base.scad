// ==== Scanner parameters ====
speaker_w = 58;        // Width
speaker_h = 58;        // Height

plate_w = 110;        // Width
plate_h = 110;        // Height
plate_thick = 5;        // Plate thickness

//scanner_d = 100;         // Depth
tab_offset = 7;         // Distance from edge to tab center (estimate! Measure yours if you can)
tab_dia = 3.6;          // This is a hole for ear
mount_dia = 3.2;        // Mounting hole diameter (estimate! Use caliper if you have one)

win_w = 75;             // Window width (measure the actual speaker if possible)
win_h = 75;             // Window height (measure the actual speaker if possible)
window_position_x = (plate_w - win_w) / 2;
window_position_y = (plate_h - win_h) / 2;

front_of_speaker_to_ear = 13.5;

layer2_x = 12.5;
layer2_y = layer2_x;
layer2_depth = 3;

inner_hole_from_edge = 4.5;

Arduino_base_x = 40;
Arduino_base_y = 33;

//difference() {
//    // --- Main plate ---
//    cube([plate_w, plate_h, plate_thick]);
//    
//    // --- speaker window ---
//    // Centered window, adjust as needed for your module!
//    translate([window_position_x, window_position_y, -1])
//        cube([win_w, win_h, plate_thick + 2]);
//    
//    // --- Mounting holes (2 outer) ---
//    translate([plate_w / 2, 7, -1])
//        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
//    translate([plate_h / 2, plate_w - 7, -1])
//        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
//}
//
//difference() {
//    translate([layer2_x, layer2_y, layer2_depth])
//        cube([win_w + 10, win_h + 10, front_of_speaker_to_ear]);
//    
//    translate([layer2_x + 5, layer2_y + 5, layer2_depth - 1])
//        cube([win_w, win_h, front_of_speaker_to_ear + 2]);
//}
//
//difference() {
//    translate([layer2_x, layer2_y, front_of_speaker_to_ear + layer2_depth])
//        cube([win_w + 10, win_h + 10, 5]);
//    
//    translate([layer2_x + 13.5, 0 , (front_of_speaker_to_ear + layer2_depth) - 1])
//        cube([speaker_w, speaker_h + 50, 5 + 2]);
//    
//    // --- Mounting holes (2 inner) ---
//    translate([layer2_x + 14 - inner_hole_from_edge, plate_w / 2, -1])
//        cylinder(d = tab_dia, h = layer2_depth + 99, $fn = 30);
//    translate([speaker_w + layer2_x + 13 + inner_hole_from_edge, plate_w / 2, -1])
//        cylinder(d = tab_dia, h = layer2_depth + 99, $fn = 30);
//}

module m3_hole_y(pos) {
    // pos = [x, z]
    translate([pos[0], 5, pos[1]])  // position X,Z; Y will be drilled through
        rotate([90, 0, 0])          // rotate cylinder to align along Y-axis
            cylinder(d=3.4, h=20, $fn=30);  // drill depth matches cube height
}

difference() {    
    translate([0, 0, 5])
        cube([plate_w, 12.5, 17]);
    
    // --- Mounting holes (2 outer) ---
    translate([plate_w / 2, 7, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
    translate([plate_h / 2, plate_w - 7, -1])
        cylinder(d = mount_dia, h = plate_thick + 99, $fn = 30);
}

difference() {
    // The base block you provided
    translate([0, -10, 0])
        cube([plate_w, 10, 120]);

    // M3 Holes on Y axis for Arduino UNO
    m3_hole_y([Arduino_base_x, Arduino_base_y]);   // Hole 1
    m3_hole_y([Arduino_base_x + 27.9, Arduino_base_y]);  // Hole 2
}