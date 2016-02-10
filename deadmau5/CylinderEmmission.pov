// Persistence of Vision Ray Tracer Scene Description File
// File: ?.pov
// Vers: 3.6
// Desc: Basic Scene Example
// Date: mm/dd/yy
// Auth: ?
//

#version 3.6;

#include "colors.inc"
#include "math.inc"
#include "transforms.inc"
///*
global_settings {
	assumed_gamma 1.0
}
//*/

// ----------------------------------------
#declare f_camera_size=5;
camera {
//	orthographic
	location	<0.0, 0.0, -1.0>*8
	direction	1.5*z
	right		x*image_width/image_height*f_camera_size
	up		y*f_camera_size
	look_at		<0.0, 0.0,  0.0>
	translate	0.5
}
/*
sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}
*/

light_source {
	<0, 0, 0>            // light's position (translated below)
	color rgb <1, 1, 1>  // light's color
	translate <-30*0, 20, -30>
}

// ----------------------------------------
/*
plane {
  y, -2
  pigment { color rgb <0.7,0.5,0.3> }
}
*/

/*
sphere {
  0.0, 1
  texture {
    pigment {
      radial
      frequency 8
      color_map {
        [0.00 color rgb <1.0,0.4,0.2> ]
        [0.33 color rgb <0.2,0.4,1.0> ]
        [0.66 color rgb <0.4,1.0,0.2> ]
        [1.00 color rgb <1.0,0.4,0.2> ]
      }
    }
    finish{
      specular 0.6
    }
  }
}
*/

// create a isosurface object - the equipotential surface
#local v3_vec_one=0*(x+y+z);
#local v3_vec_two=y+0*z+1*x;
#local f_radius=1;
#local v3_diff=v3_vec_two-v3_vec_one;
#local trans_matrix = Point_At_Trans(vnormalize(v3_diff));
#local f_length = vlength(v3_diff);
cylinder{
	v3_vec_one, y, 2
	pigment{color Green}
///*
	pigment {rgbt 1} 
	hollow finish{ ambient 0.000 diffuse 0.000 specular 0} 
	interior{ 
		media{ 
			density {
				cylindrical 
				density_map{

					[0.0  rgbt <1.0,1.0,1.0,0.0>*0.00+t]
					[0.1  rgbt <1.0,1.0,1.0,0.0>*0.02+t]
					[0.2  rgbt <1.0,1.0,1.0,0.0>*0.04+t]
					[0.3  rgbt <1.0,1.0,1.0,0.0>*0.06+t]
					[0.4  rgbt <1.0,1.0,1.0,0.0>*0.08+t]                   
					[0.5  rgbt <1.0,1.0,1.0,0.0>*0.10+t]
					[0.6  rgbt <1.0,1.0,1.0,0.0>*0.80+t]
					[0.7  rgbt <1.0,1.0,1.0,0.0>*0.85+t]
					[0.8  rgbt <1.0,1.0,1.0,0.0>*0.90+t]
					[0.9  rgbt <1.0,1.0,1.0,0.0>*0.95+t]
					[1.0  rgbt <1.0,1.0,1.0,0.0>*1.00+t]
				}  
				scale 2.01	
			}
  
			emission Green/1
		}
	}
	scale f_radius*x+f_length*y+f_radius*z
	transform{trans_matrix }
	translate v3_vec_one	
//*/	

}
