/*
ArduBMO
Version:
TODO: Everything.
*/

$fn=36;

outerX = 75;
outerY = 100;
outerZ = 33;
outerR = 10;
wall = 5;

/* MODULES */

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
	for (i = [0:1:4]){
		translate([outerX/7*i,0,-1]) roundedBox(0.03*outerX, 0.28*outerY, 2+wall, 0.1*outerR);
	}
}

module batteryHatch(){
	roundedBox(0.67*outerX, 0.33*outerY, 2+wall, 0.1*outerR);
}

/* CASE BACK */

difference(){
	/* solid block */
	roundedBox(outerX,outerY,outerZ,outerR);

	/* hollow */
	translate([wall,wall,wall]){ 
		roundedBox(outerX-(2*wall),outerY-(2*wall),outerZ,outerR-wall);
	}

	/* remove back vents */
	translate([(outerX - (4*(outerX/7)+(0.03*outerX)))/2, 0.85*outerX,0]){
		backVents();
	}
	
	/* remove battery hatch */ 
	translate([(outerX-(0.67*outerX))/2, 0.3*outerX, -1]){
		batteryHatch();
	}
	
}
