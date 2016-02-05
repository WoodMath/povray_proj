// PoVRay 3.7 Scene File " ... .pov"
// author:  ...
// date:    ...
//--------------------------------------------------------------------------
//#version 3.7;
//global_settings{ assumed_gamma 0.8 }
global_settings{ assumed_gamma 1.0 }

//#default{ finish{ ambient 0.1 diffuse 0.9 }} 
//--------------------------------------------------------------------------
#include "colors.inc"
#include "sun.inc"
#include "earth.inc"
#include "eye.inc"

//--------------------------------------------------------------------------
// camera ------------------------------------------------------------------
#declare Camera_0 = camera {/*ultra_wide_angle*/ angle 75      // front view
                            location  <0.0 , 1.0 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_1 = camera {/*ultra_wide_angle*/ angle 90   // diagonal view
                            location  <2.0 , 2.5 ,-3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_2 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 0.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_3 = camera {/*ultra_wide_angle*/ angle 90        // top view
                            location  <0.0 , 3.0 ,-0.001>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}
#declare Camera_4 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <3.0 , 1.0 , 3.0>
                            right     x*image_width/image_height
                            look_at   <0.0 , 1.0 , 0.0>}                            

#declare Camera_5 = camera {/*ultra_wide_angle*/ angle 90 // right side view
                            location  <1.0 , 1.0 , 0.0>*3
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                            

#declare Camera_6 = camera {/*ultra_wide_angle*/// angle 90 // right side view
                            location  <1.0 , 1.0 , 1.0>*3
//                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                            

#declare Camera_7 = camera {/*ultra_wide_angle*/// angle 90 // right side view
                            location  <1.0 , 1.0 , 1.0>*5
                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                            

#declare Camera_8 = camera {/*ultra_wide_angle*/// angle 90 // right side view
                            location  <0.0 , 1.0 , 0.0>*5
//                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                            

#declare Camera_9 = camera {/*ultra_wide_angle*/// angle 90 // right side view
                            location  <0.0 , 0.0 , 1.0>*5
//                            right     x*image_width/image_height
                            look_at   <0.0 , 0.0 , 0.0>}                            


camera{Camera_7}

// sun ---------------------------------------------------------------------
light_source{<500,2500,500>/1 color White}
// sky ---------------------------------------------------------------------

///*
/*
sky_sphere { pigment { gradient <0,1,0>
                       color_map { [0.00 rgb <1.0,1.0,1.0>]
                                   [0.30 rgb <0.0,0.1,1.0>]
                                   [0.70 rgb <0.0,0.1,1.0>]
                                   [1.00 rgb <1.0,1.0,1.0>] 
                                 } 
                       scale 2         
                     } // end of pigment
           } //end of skysphere
*/
// starry sky ----------------
/*
#include "stars.inc"
sphere{
	<0,0,0>, 1
        texture{
		Starfield1 scale 0.25
	} // end of texture
        scale 10000
}
*/

sky_sphere{
	pigment {
		bozo
		color_map {
			[0.0 White*3]
			[0.2 Black]
			[1.0 Black]
		}
		scale .005
	}
} 

//#include "starfield.inc"
// fog ---------------------------------------------------------------------

// ground ------------------------------------------------------------------
///*
#declare obj_plane = plane{
	<0,1,0>, -2 
	texture{
		pigment{ color rgb <0.825,0.57,0.35>}
                normal { bumps 0.75 scale 0.025  }
                finish { phong 0.1 } 
	} // end of texture
} // end of plane



#declare f_head_size = 0.2;

#declare o_arrow = union{

        sphere{0, 0.05}
        cylinder{0, (2.5*x-0.25*x), 0.05}
        cone{ 2.25*x, 0.1, 2.5*x, 0.01}
        
}

#declare o_axis = union{
	object{o_arrow pigment{color Red}}
	object{o_arrow rotate z*90 pigment{color Green}}
	object{o_arrow rotate y*-90 pigment{color Blue}}
	no_shadow
} 

//object{o_axis}
//cylinder{0,x, 0.05 pigment{color Red} scale x*10}
//cylinder{0,y, 0.05 pigment{color Green} scale y*10}
//cylinder{0,z, 0.05 pigment{color Blue} scale z*10}
///*
object{m_eye_fish(f_head_size) scale x*-1 translate 1*x rotate z*0 rotate y*0} 
object{m_eye_fish(f_head_size) scale x*-1 translate 1*x rotate z*0 rotate y*0} 
object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*20 rotate y*0} 
object{m_eye_fish(f_head_size) scale x*-1 translate 2*x rotate z*20 rotate y*30} 


object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*30 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 2*x rotate z*40 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*40 rotate y*50} 

object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*30 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 2*x rotate z*40 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*100} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*20 rotate y*100} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*50 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*100} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*50 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*40 rotate y*100} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*50 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*80} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*60} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*50 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*90} 

object{m_eye_fish(f_head_size) scale x*-1 translate 7*x rotate z*30 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*100} 

object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*20 rotate y*100} 
object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*20 rotate y*90} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*20 rotate y*70} 

object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*30 rotate y*100} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*90} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 3*x rotate z*30 rotate y*70} 
//*/

object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*100} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*90} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*70} 

object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*100} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*90} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*80} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*70} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*40 rotate y*30} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*40 rotate y*50} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*40 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*40 rotate y*10} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*20} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*60} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*80} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*30} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*50} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*10 rotate y*10} 

object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*20 rotate y*20} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*40 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*10 rotate y*60} 
object{m_eye_fish(f_head_size) scale x*-1 translate 4*x rotate z*30 rotate y*80} 

object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*30} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*50} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*40 rotate y*10} 

object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*30 rotate y*20} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*30 rotate y*60} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*80} 

object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*30 rotate y*30} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*20 rotate y*50} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*20 rotate y*70} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*10 rotate y*10} 

object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*20 rotate y*20} 
object{m_eye_fish(f_head_size) scale x*-1 translate 6*x rotate z*40 rotate y*40} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*10 rotate y*60} 
object{m_eye_fish(f_head_size) scale x*-1 translate 5*x rotate z*30 rotate y*80} 

 
object{m_earth(1) no_shadow} 
object{ 
	m_sun() 
	translate -1.25*z
	scale 1.8
	rotate -35*x
	rotate 45*y
	no_shadow
} 

