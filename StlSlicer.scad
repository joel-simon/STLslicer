/*
	Joel Simon. Jan 23, 2103. joelsimon.net.
*/

headWidth = 250; // y
headDepth = 250; // x
headHeight= 401; // z

//If unkown, Use this cube to measure the objects dimensions.
//centerCube(headDepth,headWidth, headHeight);

module centerCube(x,y, z) {
	color("Yellow",0.3) translate([-x/2,-y/2,-z/2]) cube([x,y,z]);
}

module faceSlice(a, b, tx,ty,tz, rx, ry, rz) {
	startY = (a * headWidth) - headWidth/2;
	endY = (b * headWidth) - headWidth/2;

	translate([tx,ty,tz])  rotate([-90+rx,ry,rz])  intersection() { 
		color("Yellow", .5) translate([-headDepth/2,startY,-headHeight/2]) cube([headDepth, endY-startY, headHeight]);
		rotate([90,0,0]) translate([50,-2,-200]) rotate([90,0,0]) import("/Users/joelsimon/Documents/3dModeling/JoelHead/midRes.stl");		
	}
}

module main(step, skip, tx, ty, tz, rx, ry, rz) {
	for (i = [0 : (1/step)] ){
		if (i%skip == 0) { 
			faceSlice((i*step)-step, (i*step), 
						tx, ty, tz,
						(-rx/2) + (i*step)*(rx/2),
						(-ry/2) + (i*step)*(ry/2),
						(-rz/2) + (i*step)*(rz/2));
		}
	}
}


main(.05, 1, 0,0,0,0,0,180);