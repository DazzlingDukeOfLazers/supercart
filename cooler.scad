// Igloo Profile II Cooler, 50 qt
// Dimensions 14.58" W x 24.95" L x 14.77" H
inch = 25.4;
cooler_width  = 14.58 * inch;
cooler_length = 24.95 * inch;
cooler_height = 14.77 * inch;

module cooler(x,y,z) {
    translate([x,y,z]) difference() {
        // Outer cube (solid)
        cube([cooler_width, cooler_length, cooler_height], center=false);
    
        // Inner holow cutout (subtracts from outer)
        translate([1, 1,  1])
            cube([cooler_width - 2, cooler_length - 2, cooler_height - 2], center=false);
    }
}

cooler(0,0,0);



