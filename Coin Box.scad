// Parameters
box_size = 180;        // mm
width_size = 100;        // mm
box_high = 100;        // mm
thickness = 5;         // mm (wall thickness)
flap_extension = 100;  // mm (extra top part for mounting)
hole_diam = 8;         // mm
hole_margin = 30;      // mm from flap sides
hole_distance = box_size - 2 * hole_margin; // distance between holes
hole_y = hole_margin;  // Y position from left for first hole
hole_z = box_size + flap_extension / 2; // Z position for holes (centered on flap)

// Box (open at back)
difference() {
    // Outer shell
    cube([width_size, box_size, box_high]);

    // Hollow interior
    translate([thickness, thickness, thickness + 1])
        cube([width_size - 2 * thickness, box_size - 2 * thickness, box_size - thickness]);
}

//difference() {
//    // Extended top flap for mounting
//    translate([0, 0, box_high])
//        cube([box_size, thickness, flap_extension]);
//
//    // Mounting holes in extended flap
//    translate([hole_margin, thickness + 1, box_high + flap_extension / 2])
//        rotate([90,0,0])
//        cylinder(h=thickness+10, d=hole_diam, $fn=40);
//
//    translate([box_size - hole_margin, thickness + 1, box_high + flap_extension / 2])
//        rotate([90,0,0])
//        cylinder(h=thickness+10, d=hole_diam, $fn=40);
//}