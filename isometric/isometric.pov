#include "math.inc"
#include "isometric.inc"

#declare f_camera_distance = 5;
#declare f_camera_area = 5/2*1;
#declare f_camera_size = 5;
#declare f_amera_skewed = 0.7;
#declare f_aspect_ratio = image_width/image_height;
#declare v_translate = <-1,2,-1>*5;

camera_isometric(f_camera_distance,f_camera_area,f_camera_size,v_translate)



light_source
{
 <0, 0, -100>            // light's position (translated below)
 color rgb <1, 1, 1>  // light's color
 rotate <60,30,0>
 parallel
 shadowless
}


#declare unit_box=box
{
 -0.0,1
 texture
 {
  pigment {rgb 1}
//  finish {Phong_Glossy}
 }
}

object{ unit_box translate 0*x+0*y+0*z}
object{ unit_box translate 0*x+1*y+0*z}
object{ unit_box translate 0*x+2*y+0*z}
object{ unit_box translate 0*x+3*y+0*z}
object{ unit_box translate 0*x+4*y+0*z}
object{ unit_box translate 0*x+5*y+0*z}
object{ unit_box translate 0*x+6*y+0*z}
object{ unit_box translate 0*x+7*y+0*z}
object{ unit_box translate 0*x+8*y+0*z}
object{ unit_box translate 0*x+9*y+0*z}

//object{ unit_box translate 0*x+0*y+0*z}

object{ unit_box translate 1*x+0*y+0*z}
object{ unit_box translate 2*x+0*y+0*z}
object{ unit_box translate 3*x+0*y+0*z}
object{ unit_box translate 4*x+0*y+0*z}
object{ unit_box translate 5*x+0*y+0*z}
object{ unit_box translate 6*x+0*y+0*z}
object{ unit_box translate 7*x+0*y+0*z}
object{ unit_box translate 8*x+0*y+0*z}
object{ unit_box translate 9*x+0*y+0*z}



object{ unit_box translate 0*x+9*y+-1*z}
object{ unit_box translate 0*x+9*y+-2*z}
object{ unit_box translate 0*x+9*y+-3*z}
object{ unit_box translate 0*x+9*y+-4*z}
object{ unit_box translate 0*x+9*y+-5*z}
object{ unit_box translate 0*x+9*y+-6*z}
object{ unit_box translate 0*x+9*y+-7*z}
//object{ unit_box translate 0*x+9*y+-8*z}
//object{ unit_box translate 0*x+9*y+-9*z}


