/*
ArduBMO / Front
Version: 0.01
TODO:
*/

$fn=36;

outerX = 75;
outerY = 100;
outerZ = 5;
outerR = 10;
wall = 5;

/* MODULES */

module roundedBox(x,y,z,r)
{
	translate([r,r,0])
	{
		linear_extrude(height=z)
		{
			hull()
			{
				circle(r);
				translate([x-(2*r), 0, 0]) circle(r);
				translate([0, y-(2*r), 0]) circle(r);
				translate([x-(2*r), y-(2*r), 0]) circle(r);
			}
		}
	}
}

module screenHole()
{
	roundedBox(60,45,outerZ+2,outerR/2);
}

module frontSlotHole()
{
	roundedBox(25,4,outerZ+2,0.5);
}

module arrowKeyHole()
{
	union()
	{
		translate([3,0,0]) roundedBox(3, 9 ,outerZ+2, 0.5);
		translate([0,3,0]) roundedBox(9, 3, outerZ+2, 0.5);
	}
}

module controllerHole()
{
	roundedBox(6, 2, outerZ+2, 0.5);
}

module topBlueButtonHole()
{
	cylinder(outerZ+2, 2.5, 2.5);
}

module middleGreenButtonHole()
{
	cylinder(outerZ+2, 3, 3);
}

module bottomRedButtonHole()
{
	cylinder(outerZ+2, 5.5, 5.5);
}

module triangleCyanHole()
{
	radius=5;
	o=radius/2;                
	a=radius*sqrt(3)/2; 
	
	linear_extrude(height=outerZ+2)
	{
	translate([a, radius/2, 0]) polygon(points=[[-a,-o],[0,radius],[a,-o]],paths=[[0,1,2]]);
	}
}

/* CASE FRONT */

difference()
{
	/* solid block */
	roundedBox(outerX,outerY,outerZ,outerR);
	
	/* remove screenHole */
	translate([7.5, outerY-53, -1]) screenHole();

	/* remove frontSlotHole */
	translate([12,37,-1]) frontSlotHole();
	
	/* remove arrowKeyHole */
	translate([12,19,-1]) arrowKeyHole();	

	/* remove controllerHole (A and B) */
	translate([10, 9, -1]) controllerHole();
	translate([18, 9, -1]) controllerHole();
	
	/* remove front right button holes */
	translate([58, 37, -1]) topBlueButtonHole();
	translate([60, 22, -1]) middleGreenButtonHole();
	translate([48, 14, -1]) bottomRedButtonHole();
	translate([40,24,-1]) triangleCyanHole();

}
