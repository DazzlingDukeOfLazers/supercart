// Function to create a hollow square tube (wireframe edge)
module square_tube(length, OD, wall_thickness) {
    difference() {
        // Outer square tube (solid)
        cube([OD, OD, length], center=false);
        
        // Inner hollow cutout (subtracts from outer)
        translate([wall_thickness, wall_thickness, 0])
            cube([OD - 2 * wall_thickness, OD - 2 * wall_thickness, length], center=false);
    }
}