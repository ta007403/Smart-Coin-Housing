// NDE-1000 Mount Base Parameters
device_width = 242;         // Width of NDE-1000
device_depth = 200;         // Depth
base_thickness = 5;         // 5 mm thick printable base
hole_diameter = 4.3;        // For M4 screw
hole_offset_x = 5;         // From side edges
hole_offset_y = 33.1;         // From front
hole_offset_y_rear = 159.1;         // From rear
Base_Up = 30;
Wing_Width = 24;

// Mounting Hole Positions (relative to base)
hole_positions = [
    [hole_offset_x, hole_offset_y],
    [device_width - hole_offset_x, hole_offset_y],
    [hole_offset_x, hole_offset_y_rear],
    [device_width - hole_offset_x, hole_offset_y_rear]
];

difference() {
    union(){
        // Base plate
        translate([0, 0, Base_Up])
            cube([device_width, device_depth, base_thickness]);
        
        translate([Wing_Width, 0, 0])
            cube([Wing_Width, device_depth, Base_Up]);
        
        cube([24, 10, Base_Up]);
        
        translate([device_width - Wing_Width * 2, 0, 0])
            cube([Wing_Width, device_depth, Base_Up]);
        
        translate([device_width - Wing_Width, 0, 0])
            cube([24, 10, Base_Up]);

    }

    // Screw holes
    translate([0, 0, Base_Up])
        for (pos = hole_positions) {
            translate([pos[0], pos[1], -1])  // go slightly below to guarantee cut
                cylinder(d = hole_diameter, h = base_thickness + 2, $fn = 40);
        }
        
    translate([10, 50, 15])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=100, $fn=40);
        
    translate([device_width - 10, 50, 15])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=100, $fn=40);
        
}
