

#version 3.6;

#include "colors.inc"
#include "math.inc"
#include "bezier.inc"
#include "arrows.inc"

#declare x_theta_phi_radius=function(theta,phi,rad){rad*(cosd(theta))*(cosd(phi))}
#declare y_theta_phi_radius=function(theta,phi,rad){rad*(sind(phi))}
#declare z_theta_phi_radius=function(theta,phi,rad){rad*(sind(theta))*(cosd(phi))}

#macro xyz_theta_phi_radius(theta,phi,rad)

        #local rtrn = <0,0,0>;
        #local rtrn = rtrn + x_theta_phi_radius(theta,phi,rad)*x;
        #local rtrn = rtrn + y_theta_phi_radius(theta,phi,rad)*y;
        #local rtrn = rtrn + z_theta_phi_radius(theta,phi,rad)*z;
        rtrn          

#end

#declare theta_x_y_z=function(x,y,z){(atan2d(x, z))}
#declare phi_x_y_z=function(x,y,z){(atan2d(sqrt(pow(x,2)+pow(z,2)), y))}
#declare rad_x_y_z=function(x,y,z){sqrt(pow(x,2)+pow(y,2)+pow(z,2))}



global_settings {
  assumed_gamma 1.0
}


camera {
  orthographic 

  location  0-18*z
//  direction 1.5*z
//  right     x*image_width/image_height
  look_at   <0.0, 0.0,  0.0>
  
  
}

sky_sphere {
  pigment {
    gradient y
    color_map {
      [0.0 rgb <0.6,0.7,1.0>*0]
      [0.7 rgb <0.0,0.1,0.8>*0]
    }
  }
}

#local pos_light=<-5, 5, -2>;
#local ls_reg=light_source {
  <0, 0, 0>            // light's position (translated below)
  color rgb <1, 1, 1>  // light's color
//  translate <-5, 5, -2>
  translate pos_light
}

#local ls_spt=// create a point "spotlight" (conical directed) light source
light_source {
//  <0,0,0>                 // light's position (translated below)
  pos_light
  color rgb <1,1,1>       // light's color
  spotlight               // this kind of light source
//  translate <40, 80, -40> // <x y z> position of light
  point_at <0, 0, 0>      // direction of spotlight
  radius 5                // hotspot (inner, in degrees)
  tightness 50            // tightness of falloff (1...100) lower is softer, higher is tighter
  falloff 8               // intensity falloff radius (outer, in degrees)
}

#local ls_cyl=
// create a point "spotlight" (cylindrical directed) light source
light_source {
//  0*x                     // light's position (translated below)
  pos_light
  color rgb <1,1,1>       // light's color
  spotlight               // this kind of light source
  cylinder                // this variation
//  translate <40, 80, -40> // <x y z> position of light
  point_at <0, 0, 0>      // direction of spotlight
  radius 5                // hotspot (inner, in degrees)
  tightness 50            // tightness of falloff (1...100) lower is softer, higher is tighter
  falloff 8               // intensity falloff radius (outer, in degrees)
}

#local ls_area=
// An area light (creates soft shadows)
// WARNING: This special light can significantly slow down rendering times!
light_source {
  <0,0,0>             // light's position (translated below)
  color rgb 1.0       // light's color
  area_light
  <8, 0, 0> <0, 0, 8> // lights spread out across this distance (x * z)
  4, 4                // total number of lights in grid (4x*4z = 16 lights)
  adaptive 0          // 0,1,2,3...
  jitter              // adds random softening of light
  circular            // make the shape of the light circular
  orient              // orient light
  translate <40, 80, -40>   // <x y z> position of light
}


light_source{ls_area}

plane {
  y, -10
  pigment { color rgb <0.7,0.5,0.3>*0 }
}


#declare tex_image = texture{pigment{image_map{"deadmau5_model.png"} } scale (x+y)*16+z*1 translate z*2}

/*
box{
        0, <16,16,16> 
        scale z*1/160 
        texture{tex_image}
        translate -8*(x+y)
} 
*/
#declare pig_sphere_large = pigment{color Red transmit 0.50}
#declare pig_sphere_small = pigment{color Blue transmit 0.50}
#declare pig_arrow = pigment{color Blue transmit 0.850}
#declare f_sphere_large_radius = 3.15;
#declare f_sphere_small_radius = 0.08;
#declare f_sweep_radius = 0.1;

#declare vect_sphere_center = -1.75*y+0.09*x;

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
                reflection 0.25
//                reflection {0.0}
//                reflection rgb <1,1,1>
                roughness 1.0
                specular .05 
//                specular albedo 0.0 

        }
    }
};


#declare obj_sphere_black = sphere{ 0, f_sphere_large_radius material{mat_use} translate vect_sphere_center}
#declare obj_sphere_green = sphere{ 0, f_sphere_small_radius pigment{pig_sphere_small} }

//#local f_vect_radius = 0.1; 
#declare f_theta_spacing = 3.5;
#local v1_v0= <1.7,0.8,0,f_sweep_radius> ;
#local v1_v3= <6.9,2.7,0,f_sweep_radius> ;
#local v1_v1= v1_v0 + 1.15*<1.15,3,0,0.00> ;
#local v1_v2= v1_v3 + 1.15*<-1.1,1.5,0,0.00> ;



#local v2_v0= <6.9,2.7,0,f_sweep_radius>*0+v1_v3 ;
#local v2_v3= <3.1,-1.3,0,f_sweep_radius> ;
#local v2_v1= v2_v0 + 1.2*<1.1,-1.5,0,0.00> ;
#local v2_v2= v2_v3 + 0.8*<4,-0.5,0,0.00> ;





#macro sphere_line(f_theta_min,f_theta_max,f_theta_spacing,f_phi,f_radius_use)
        #local i_inc = f_theta_min;
        union{          
                #if(f_theta_min < f_theta_max)
                        #local f_direction = 1;
                        #while( i_inc <= f_theta_max) 
                               object{ obj_sphere_green translate xyz_theta_phi_radius(i_inc*f_theta_spacing,f_phi,f_radius_use) }
                                #local i_inc = i_inc + f_direction;
 //                               #local f_phi = f_phi + f_phi_shifting;
                        #end
                #end
                #if(f_theta_max < f_theta_min)
                        #local f_direction = -1;
                        #while( i_inc >= f_theta_max) 
                               object{ obj_sphere_green translate xyz_theta_phi_radius(i_inc*f_theta_spacing,f_phi,f_radius_use) }
                                #local i_inc = i_inc + f_direction;
//                                #local f_phi = f_phi + f_phi_shifting;
                        #end

                #end
        }        
#end

#macro sphere_line_shift(f_theta_min,f_theta_max,f_theta_spacing,f_phi,f_phi_shifting,f_radius_use)
        #local i_inc = f_theta_min;
        union{          
                #if(f_theta_min < f_theta_max)
                        #local f_direction = 1;
                        #while( i_inc <= f_theta_max) 
                               object{ obj_sphere_green translate xyz_theta_phi_radius(i_inc*f_theta_spacing,f_phi,f_radius_use) }
                                #local i_inc = i_inc + f_direction;
                                #local f_phi = f_phi + f_phi_shifting;
                        #end
                #end
                #if(f_theta_max < f_theta_min)
                        #local f_direction = -1;
                        #while( i_inc >= f_theta_max) 
                               object{ obj_sphere_green translate xyz_theta_phi_radius(i_inc*f_theta_spacing,f_phi,f_radius_use) }
                                #local i_inc = i_inc + f_direction;
                                #local f_phi = f_phi + f_phi_shifting;
                        #end

                #end
        }        
#end


#declare obj_eyes_mouth =
union{

        sphere_line(-17,17,f_theta_spacing,-1*f_theta_spacing,f_sphere_large_radius)
        sphere_line(-16,16,f_theta_spacing,-2*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-16,16,f_theta_spacing,-3*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-15,15,f_theta_spacing,-4*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-14,14,f_theta_spacing,-5*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-14,14,f_theta_spacing,-6*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-13,13,f_theta_spacing,-7*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-11,11,f_theta_spacing,-8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-8,8,f_theta_spacing,-9*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-7,7,f_theta_spacing,-10*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-4,4,f_theta_spacing,-11*f_theta_spacing,f_sphere_large_radius)        


        sphere_line(-14,-11,f_theta_spacing,2.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-16.5,-9.5,f_theta_spacing,3.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-17.5,-8.5,f_theta_spacing,4.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-17.5,-7.5,f_theta_spacing,5.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-19,-8,f_theta_spacing,6.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(-20,-7,f_theta_spacing,7.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-7,-20,f_theta_spacing,8.8*f_theta_spacing,-0.01*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-7,-20,1.05*f_theta_spacing,9.8*f_theta_spacing,-0.021*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-6,-20,1.05*f_theta_spacing,10.8*f_theta_spacing,-0.021*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-6.5,-20,1.05*f_theta_spacing,11.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-7.0,-19,1.05*f_theta_spacing,12.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-8.0,-18,1.05*f_theta_spacing,13.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-9.0,-16,1.05*f_theta_spacing,14.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(-11.0,-15,1.05*f_theta_spacing,15.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        

///*
        sphere_line(11,14,f_theta_spacing,2.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(9.5,16.5,f_theta_spacing,3.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(8.5,17.5,f_theta_spacing,4.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(7.5,17.5,f_theta_spacing,5.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(8,19,f_theta_spacing,6.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line(7,20,f_theta_spacing,7.8*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(7,20,f_theta_spacing,8.8*f_theta_spacing,-0.01*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(7,20,1.05*f_theta_spacing,9.8*f_theta_spacing,-0.021*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(6,20,1.05*f_theta_spacing,10.8*f_theta_spacing,-0.021*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(6.5,20,1.05*f_theta_spacing,11.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(7.0,19,1.05*f_theta_spacing,12.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(8.0,18,1.05*f_theta_spacing,13.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(9.0,16,1.05*f_theta_spacing,14.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        
        sphere_line_shift(11.0,15,1.05*f_theta_spacing,15.8*f_theta_spacing,-0.025*f_theta_spacing,f_sphere_large_radius)        

//*/

        rotate 90*y
        rotate -21*x
        
        translate vect_sphere_center
}        




#declare obj_ears=
merge{
        object{bezier_basis_vector_n(v2_v0,v2_v1,v2_v2,v2_v3,6) }
        object{bezier_basis_vector_n(v1_v0,v1_v1,v1_v2,v1_v3,6) }
        object{bezier_basis_vector_n(v2_v0,v2_v1,v2_v2,v2_v3,6) rotate y*180 translate x*0.2}
        object{bezier_basis_vector_n(v1_v0,v1_v1,v1_v2,v1_v3,6) rotate y*180 translate x*0.2}
        pigment{pig_sphere_small}
}


object{ obj_sphere_black }
object{ obj_eyes_mouth }
object{ obj_ears }

