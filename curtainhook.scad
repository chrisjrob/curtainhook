// curtainhook.scad
// A curtain hook
// 
// Copyright 2013 Christopher Roberts

// Global Parameters
hook_diameter_ext   = 15.8;
hook_thickness      = 2.55;
hook_depth          = 3.7;
hook_opening        = 4.45;
eye_diameter        = 4.98;
eye_thickness       = 2.14;
eye_hook_gap        = 2;
eye_depth           = 1.52;

module curtainhook() {

    difference() {

        // Things that exist
        union() {
            translate( v = [ 0, -hook_diameter_ext/2 - (eye_diameter/2) - eye_hook_gap, 0 ] ) {

                // Body of eye
                cylinder( h = eye_depth, r = eye_diameter/2 + eye_thickness, $fn=100 );

                // Body of eye
                translate( v = [ -(eye_diameter + 2*eye_thickness)/2, 0, 0] ) {
                    cube( size = [eye_diameter + eye_thickness*2, eye_diameter/2 + eye_thickness + eye_hook_gap + hook_thickness/2, eye_depth] );
                }
            }

            // Body of hook
            cylinder( h = hook_depth, r = hook_diameter_ext/2, $fn=100 );
        }

        // Things to be cut out
        union() {

            // Hole in eye
            translate( v = [ 0, -hook_diameter_ext/2 - (eye_diameter/2) - eye_hook_gap, 0 ] ) {
                cylinder( h = hook_depth, r = eye_diameter/2, $fn=100 );
            }

            // Hole in centre of hook
            cylinder( h = hook_depth, r = hook_diameter_ext/2 - hook_thickness, $fn=100 );

            // Opening
            rotate( a = [ 0, 0, -40] ) {
                translate( v = [hook_diameter_ext/2 - hook_thickness * 1.5, -hook_opening/2, 0] ) {
                    # cube( size = [hook_thickness * 2, hook_opening, hook_thickness*1.5] );
                }
            }

            // Opening
            translate( v = [hook_diameter_ext/2 - hook_thickness * 2, -hook_opening/1.1, 0] ) {
                rotate( a = [ 0, 0, -20] ) {
                    # cube( size = [hook_thickness * 2, hook_opening, hook_thickness*1.5] );
                }
            }

        }

    }

}

curtainhook();

// http://en.wikibooks.org/wiki/OpenSCAD_User_Manual

// primitives
// cube(size = [1,2,3], center = true);
// sphere( r = 10, $fn=100 );
// circle( r = 10 );
// cylinder( h = 10, r = 20, $fs = 6, center = true );
// cylinder( h = 10, r1 = 10, r2 = 20, $fs = 6, center = false );
// polyhedron(points = [ [x, y, z], ... ], triangles = [ [p1, p2, p3..], ... ], convexity = N);
// polygon(points = [ [x, y], ... ], paths = [ [p1, p2, p3..], ... ], convexity = N);

// transormations
// scale(v = [x, y, z]) { ... }
// rotate(a=[0,180,0]) { ... }
// translate(v = [x, y, z]) { ... }
// mirror([ 0, 1, 0 ]) { ... }

// rounded box by combining a cube and single cylinder
// $fn=50;
// minkowski() {
//   cube([10,10,1]);
//   cylinder(r=2,h=1);
// }

// hull() {
//   translate([15,10,0]) circle(10);
//   circle(10);
// }

// dxf_linear_extrude(file="tridentlogo.dxf", height = 1, center = false, convexity = 10);
// deprecated - import_dxf(file="design.dxf", layer="layername", origin = [100,100], scale = 0.5);
// linear_extrude(height = 10, center = true, convexity = 10, twist = 0, $fn = 100)
// rotate_extrude(convexity = 10, $fn = 100)
// import_stl("example012.stl", convexity = 5);

// for (z = [-1, 1] ) { ... } // two iterations, z = -1, z = 1
// for (z = [ 0 : 5 ] ) { ... } // range of interations step 1
// for (z = [ 0 : 2 : 5 ] ) { ... } // range of interations step 2

// for (i = [ [ 0, 0, 0 ], [...] ] ) { ... } // range of rotations or vectors
// usage say rotate($i) or translate($i)
// if ( x > y ) { ... } else { ... }
// assign (angle = i*360/20, distance = i*10, r = i*2)
