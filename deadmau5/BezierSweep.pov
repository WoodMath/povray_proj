

#version 3.6;

#include "colors.inc"
#include "math.inc"
#include "Bezier_test.inc"

global_settings {
  assumed_gamma 1.0
}


camera {
  location  0-5*z
//  direction 1.5*z
//  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>]
      [0.7 rgb <0.0,0.1,0.8>]
    }
  }
}

light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
  translate <-0, 10, -0>
}

plane {
  y, -2
  pigment { color rgb <0.7,0.5,0.3> }
}






#local v0=<-3,0,0,0.05>;
#local v1=<-1,3,0,0.05>;
#local v2=<1,3,0,0.05>;
#local v3=<3,0,0,0.05>;

 


#local v_v0=<-1,0,0,0.05>;
#local v_v1=<-1,3,0,0.20>;
#local v_v2=<1,3,0,0.20>;
#local v_v3=<1,0,0,0.05>;


object{bezier_basis_vector_n(v_v0,v_v1,v_v2,v_v3,6) pigment{color Green transmit 0.5}}

  
