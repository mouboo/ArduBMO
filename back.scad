/*
ArduBMO
Version:
TODO: Everything.
*/

$fn=72;

module roundedBox(x,y,z,r){
	translate([r,r,0]){
		linear_extrude(height=z){
			hull(){
				circle(r);
				translate([x-(2*r), 0, 0]) circle(r);
				translate([0, y-(2*r), 0]) circle(r);
				translate([x-(2*r), y-(2*r), 0]) circle(r);
			}
		}
	}
}

module backVents(){
	for (i = [0:3:12]){
		translate([i,0,-1]) roundedBox(0.5,7,4,0.25);
	}
}


/* Bottom */
color([99/255, 189/255, 164/255]){
	difference(){
		roundedBox(20,30,10,3);
		translate([1,1,2]) roundedBox(18,28,10,2);
		translate([4,18,0]) backVents();
	}
}


/* Lid */
color([99/255, 189/255, 164/255]){
	translate([-23,0,0]){
		difference(){
			roundedBox(20,30,1,3);
			translate([3,13,-1]) roundedBox(14,14,3,1);
		}
	}
}
