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

///*
global_settings {
  assumed_gamma 1.0
}
//*/

// ----------------------------------------

camera {
  location  <1.0, 1.0, 1.0>*10*0+30*z
  direction 1.5*z
  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
}

#declare ls1=
light_source {
  <0,0,0>                         // light's position (translated below)
  color rgb <1, 1, 1>             // light's color
  translate <10, 10, 10>*0
}

#declare ls2=
light_source {
  <0,0,0>                         // light's position (translated below)
  color rgb <1, 1, 1>
  area_light
  (x-z)*5,(-x+y-z)*5,5,5
  adaptive 10
  jitter
  
               // light's color
  translate <10, 10, 10>*0
}

#declare ls3=
// create a point "spotlight" (conical directed) light source
light_source {
  <1,1,1>*10                 // light's position (translated below)
  color rgb <1,1,1>       // light's color
  spotlight               // this kind of light source
//  translate <40, 80, -40> // <x y z> position of light
  point_at <0, 0, 0>      // direction of spotlight
  radius 5                // hotspot (inner, in degrees)
  tightness 0            // tightness of falloff (1...100) lower is softer, higher is tighter
  falloff 100               // intensity falloff radius (outer, in degrees)
}

//light_source{ ls translate 10*(x+y)}
//light_source{ ls2 translate 7*(x+y+z)}
light_source{ ls3 translate 0}
/*
#local mat_defualt =
material{
    texture{
        pigment{ color White*0.1 }
        finish { 
                ambient rgb 0.1
                brilliance 1.0
                crand 0.0 
                diffuse 0.6
//                diffuse albedo 0.6
                metallic 1.0
                phong 0.0
                phong_size 40.0 
                reflection 1.0
//                reflection {0.0}
//                reflection rgb <1,1,1>
                specular 0.0 
//                specular albedo 0.0 

        }
    }
};
*/

#local mat_defualt =
material{
    texture{
        pigment{ color White*0.1 }
        finish { 
                ambient rgb 0.1
                brilliance 1.0
                crand 0.0 
                diffuse 0.6
//                diffuse albedo 0.6
                metallic 1.0
                phong 0.0
                phong_size 40.0 
                reflection 1.0
//                reflection {0.0}
//                reflection rgb <1,1,1>
                specular 0.0 
//                specular albedo 0.0 

        }
    }
};

#local mat_use =
material{
    texture{
        pigment{ color White*0.01 }
        finish { 
                ambient 0.0
//                brilliance 1.0
//                crand 0.0 
                diffuse 0.8
//                diffuse albedo 0.6
//                metallic 1.0
                phong 1.0
                phong_size 250.0 
//                reflection {metallic 0.85}
                reflection 0.85
//                reflection {0.0}
//                reflection rgb <1,1,1>
                roughness 1.0
                specular 0.0 
//                specular albedo 0.0 

        }
    }
};



 
sphere{                                    
    0, 3
      material{mat_use}
}