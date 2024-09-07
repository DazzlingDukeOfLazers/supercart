// Convert inches to millimeters
inch = 25.4;
OD = 1 * inch;        // Outer dimension (OD) of 1 inch for the wireframe tubes
crate_width = 13 * inch;   // 13 inch width
crate_length = 13 * inch;  // 13 inch length
crate_height = 11 * inch;  // 11 inch height
wall_thickness = 1/4 * inch;  // Thickness of the wireframe bars



use <square_tube.scad>;  // Import the square_tube module from square_tube.scad

module square_base(x,y,z) {
    translate([x, y, z]) square_tube(crate_length, OD, wall_thickness);
    translate([x + crate_length - OD, y, z]) square_tube(crate_width, OD, wall_thickness);
    translate([x, y, z + OD]) rotate([0,90,0]) square_tube(crate_length, OD, wall_thickness);
    translate([x,y,z+crate_width]) rotate([0,90,0]) square_tube(crate_width, OD, wall_thickness);
}

// Function to generate the wireframe of a cube
module crate(x,y,z) {

    // Bottom square
    square_base(x,y,z);

    // Top square
    square_base(x,y+crate_width-2*OD,z);

    // Vertical edges (from bottom to top)
    translate([x, y+crate_length-2*OD, z]) rotate([90, 0, 0]) square_tube(crate_height, OD, wall_thickness);
    translate([x+crate_length - OD, y+crate_length-2*OD, z]) rotate([90, 0, 0]) square_tube(crate_height, OD, wall_thickness);
    translate([x, y+crate_length-2*OD, z+crate_length-OD]) rotate([90, 0, 0]) square_tube(crate_height, OD, wall_thickness);
    translate([x+crate_length - OD, y+crate_length-OD, z+crate_length-OD]) rotate([90, 0, 0]) square_tube(crate_height, OD, wall_thickness);


}

// Call the wireframe crate module
crate();