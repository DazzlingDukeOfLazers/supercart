// Convert inches to millimeters
inch = 25.4;
OD = 1 * inch;         // Outer dimension (OD) of 1 inch for the square tube
wall_thickness = 1/8 * inch;  // Wall thickness of 1/8 inch
length = 13 * inch * 3;   // Longer side of the rectangle (L = 13 inches * 3)
width = 13 * inch * 2;    // Shorter side of the rectangle (W = 13 inches * 2)
crate_width = 13 * inch;  // Width of the crate

// Function to create a hollow square tube with specified length
module square_tube(length) {
    difference() {
        // Outer square tube (solid)
        cube([OD, OD, length], center=false);
        
        // Inner hollow cutout (subtracts from outer)
        translate([wall_thickness, wall_thickness, 0])
            cube([OD - 2*wall_thickness, OD - 2*wall_thickness, length], center=false);
    }
}

use <crate.scad>;  // Import the crate module from crate.scad
crate(2*OD,0,0);           // Call the crate module to generate the wireframe crate
translate([crate_width, 0,0])crate(2*OD,0,0);           // Call the crate module to generate the wireframe crate

use <cooler.scad>;  // Import the coolers module from coolers.scad
cooler(0,0,0);           // Call the coolers module to generate the wireframe cooler

// First square tube along the z-axis (shorter side, W)
translate([OD, OD, 0])  // Offset to align along the Z-axis
    square_tube(width); 

// Second square tube, offset along the x-axis by the length (L)
translate([length - 2*OD, OD, 0])  // Offset to align with the longer side
    square_tube(width);

// Third square tube along the x-axis (longer side, L), positioned on the ZY plane
translate([0, 0, OD])    // Offset to align along the Z-axis
    rotate([0, 90, 0])   // Rotate 90 degrees to align the tube along the X-axis
    square_tube(length);

// Fourth square tube along the x-axis (longer side, L), offset in the Z direction by the width
translate([0, 0, width])  // Offset along the Z-axis by the width
    rotate([0, 90, 0])    // Rotate 90 degrees to align the tube along the X-axis
    square_tube(length);