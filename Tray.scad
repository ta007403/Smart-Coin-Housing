// Parameters
tray_length = 400;
tray_width = 150;
tray_height = 15;
slope_depth = 8;
base_thickness = 20;
wedge_thick = 10;
hole_diameter = 3.2;
hole_depth = base_thickness + 50;
base_hole_position = 50;

// === Solid Body ===
difference() {
    union() {
        // Tray
        cube([tray_length, tray_width, 10]);

        // Base block
        translate([0, 0, -base_thickness])
            cube([tray_length, wedge_thick + 2, base_thickness]);
            
        // Bung block
        translate([0, tray_width - 7, 0])
            cube([tray_length, wedge_thick - 3, 15]);
    }

    // === Hole 1 ===
    translate([base_hole_position, 30, -base_thickness + 10])  // position in tray XY, height Z
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);

    // === Hole 2 ===
    translate([base_hole_position + 100, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
    
    // === Hole 3 ===
    translate([base_hole_position + 200, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
    
    // === Hole 4 ===
    translate([base_hole_position + 300, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
    
    // === Hole 5 ===
    translate([base_hole_position + 400, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
            
    // === Hole 6 ===
    translate([base_hole_position + 500, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
            
    // === Hole 7 ===
    translate([base_hole_position + 600, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
            
    // === Hole 8 ===
    translate([base_hole_position + 700, 30, -base_thickness + 10])
        rotate([90, 0, 0])
            cylinder(d=hole_diameter, h=hole_depth, $fn=40);
            
}
