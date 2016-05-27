                                                                                                           // PoVRay 3.6 Scene File " ... .pov"
// created by   ...  
// Date:   ...
//------------------------------------------------------------------------
/*
#version 3.5;
global_settings {  assumed_gamma 1.0 }
#default{ finish{ ambient 0.1 diffuse 0.9 }} 
*/
//------------------------------------------------------------------------
#include "colors.inc"
/*
#include "textures.inc"
#include "glass.inc"
#include "metals.inc"
#include "golds.inc"
#include "stones.inc"
#include "woods.inc"
#include "shapes.inc"
#include "shapes2.inc"
#include "functions.inc"
#include "math.inc"
#include "transforms.inc"
*/
//------------------------------------------------------------------------

#ifndef(f_grid_unit_size)
    #declare f_grid_unit_size = 1.0;
#end
#ifndef(f_grid_unit_size_minor)
    #declare f_grid_unit_size_minor = f_grid_unit_size;
#end
#ifndef(f_grid_unit_size_major)
    #declare f_grid_unit_size_major = f_grid_unit_size_minor*10.0;
#end
#ifndef(f_axis_unit_size)
    #declare f_axis_unit_size = 1.0;
#end
#ifndef(f_axis_unit_size_minor)
    #declare f_axis_unit_size_minor = f_axis_unit_size;
#end
#ifndef(f_axis_unit_size_major)
    #declare f_axis_unit_size_major = f_axis_unit_size_minor*10.0;
#end
#ifndef(f_camera_size)
    #declare f_camera_size=10;
#end
#ifndef(f_camera_distance)
    #declare f_camera_distance = 10.0;
#end
#ifndef(f_camera_shift)
    #declare f_camera_shift = 14.5;
#end
#ifndef(f_camera_aspect_ratio)
    #declare f_camera_aspect_ratio=image_width/image_height;
#end
#ifndef(f_camera_custom_rotation_x)
    #declare f_camera_custom_rotation_x=0;
#end
#ifndef(f_camera_custom_rotation_y)
    #declare f_camera_custom_rotation_y=0;
#end
#ifndef(f_grid_shift)
    #declare f_grid_shift=100.00;
#end

//#ifndef(cam_isometric)
    #declare cam_isometric =
    camera{
        /*ultra_wide_angle*/// angle 14   // diagonal view
        orthographic    
        location <1.0, 1.0, 1.0> * f_camera_distance
        up y*f_camera_size
        right     x*image_width/image_height * f_camera_size 
        look_at   <0.0 , 0.0 , 0.0>
        translate 0.00*x+0.00*y+0.00*z
        translate f_camera_shift*y
    }
                                                            
//#end
//#ifndef(cam_orthographic)
    #declare cam_orthographic =
    camera{
        /*ultra_wide_angle*/// angle 14   // diagonal view
        orthographic    
        location <0.0 , 0.0 , -1.0> * f_camera_distance
        up y*f_camera_size
        right     x*image_width/image_height * f_camera_size 
        look_at   <0.0 , 0.0 , 0.0>
        translate f_camera_shift*x+f_camera_shift*y
    }
//#end
//#ifndef(cam_custom)
    #declare cam_custom =
    camera{
        /*ultra_wide_angle*/// angle 14   // diagonal view
        orthographic    
        location <0.0 , 0.0 , -1.0> * f_camera_distance
        up y*f_camera_size
        right     x*image_width/image_height * f_camera_size 
        look_at   <0.0 , 0.0 , 0.0>
        translate f_camera_shift*x+f_camera_shift*y
        rotate f_camera_custom_rotation_x*x
        rotate f_camera_custom_rotation_y*y        
    }
//#end
#ifdef(def_camera_use_isometric)

    camera{cam_isometric}
///*
    light_source{
        <1.0, 1.0, 1.0> * f_camera_distance                   // light's position (translated below)
        color rgb <1,1,1>    // light's color
        parallel
        point_at <0, 0, 0>        
        translate <0, 0, 0>
    }
//*/    
#end
#ifdef(def_camera_use_orthographic)
    camera{cam_orthographic}
    light_source{
        <0.0 , 0.0 , -1.0> * f_camera_distance                  // light's position (translated below)
        color rgb <1,1,1>    // light's color
        parallel
        point_at <0, 0, 0>        
        translate f_camera_shift*x+f_camera_shift*y
//        rotate f_camera_custom_rotation_x*x
//        rotate f_camera_custom_rotation_y*y
    }
#end
#ifdef(def_camera_use_custom)
    camera{cam_custom}
    light_source{
        <0.0 , 0.0 , -1.0> * f_camera_distance                  // light's position (translated below)
        color rgb <1,1,1>    // light's color
        parallel
        point_at <0, 0, 0>        
        translate f_camera_shift*x+f_camera_shift*y
        rotate f_camera_custom_rotation_x*x
        rotate f_camera_custom_rotation_y*y
    }
#end


#macro Axis_( AxisLen_Major, Dark_Texture,Light_Texture, AxisLen_Minor) 
    union{
        cylinder{
            <0,-AxisLen_Major*0.1,0>,<0,AxisLen_Major*0.1,0>,0.10
                texture{
                    checker
                    texture{Dark_Texture } 
                    texture{Light_Texture}
                    translate<-0.5,0,-0.5>
                    scale AxisLen_Minor*0.1*y
                }
        }
        cone{
            <0,AxisLen_Major*0.1,0>,0.4,<0,AxisLen_Major*0.1+0.7,0>,0
            texture{Dark_Texture}
        }
        cone{
            <0,-AxisLen_Major*0.1,0>,0.4,<0,-1*(AxisLen_Major*0.1+0.7),0>,0
            texture{Light_Texture}
        }       
    }
#end

#macro AxisXYZ( AxisLenX, AxisLenY, AxisLenZ, Tex_Dark, Tex_Light, AxisLen_Minor)
    #local f_text_scale=2.0;
    union{
        #if (AxisLenX != 0)
            object { Axis_(AxisLenX, Tex_Dark, Tex_Light, AxisLen_Minor)   rotate< 0,0,-90>}// x-Axis
//            text   { ttf "ariali.ttf",  "+x",  0.15,  0  texture{Tex_Dark}
//                  rotate y*-180 
//                  scale f_text_scale translate <AxisLenX+3,0.5,-0.00>}
        #end 
        #if (AxisLenY != 0)
            object { Axis_(AxisLenY, Tex_Dark, Tex_Light, AxisLen_Minor)   rotate< 0,0,  0> }// y-Axis
//            text   { ttf "ariali.ttf",  "+y",  0.15,  0  texture{Tex_Dark}
//                   rotate y*-135    
//                   scale f_text_scale translate <-.00,AxisLenY+1,-0.00>}
        #end
        #if (AxisLenZ != 0)
            object { Axis_(AxisLenZ, Tex_Dark, Tex_Light, AxisLen_Minor)   rotate<-90,-180,  0>}// z-Axis
//            text   { ttf "ariali.ttf",  "+z",  0.15,  0  texture{Tex_Dark}
//                       rotate y*-90
//                       scale f_text_scale translate <0.00,0.5,AxisLenZ+1>}
        #end
        no_shadow 
    }
#end

#declare Texture_A_Dark  = texture {pigment{ color rgb<1,0.45,0>} finish { phong 1}}
#declare Texture_A_Light = texture {pigment{ color rgb<1,1,1>} finish { phong 1}}


#declare RasterScale = 0.10;
#declare RasterHalfLine  = 0.05;  
#declare RasterHalfLine_Minor_Multiplier = 1.5; 
#declare RasterHalfLine_Major_Multiplier = 0.5; 

#macro Raster(RScale, HLine) 
    pigment{ 
        gradient x scale RScale
        color_map{
            [0.000   color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,0>*0.6]
            [1.000   color rgbt<1,1,1,0>*0.6]
        }
    }
#end

#macro Raster_Minor(RScale, HLine) 
    pigment{ 
        gradient x scale RScale
        color_map{
            [0.000   color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,0>*0.6]
            [1.000   color rgbt<1,1,1,0>*0.6]
        }
    }
#end

#macro Raster_Major(RScale, HLine) 
    pigment{ 
        gradient x scale RScale
        color_map{
            [0.000   color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,0>*0.6]
            [0+HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,1>]
            [1-HLine color rgbt<1,1,1,0>*0.6]
            [1.000   color rgbt<1,1,1,0>*0.6]
        }
    }
#end

#declare o_old_plane=
plane { 
    <0,1,0>, 0    // plane with layered textures
    texture {
        pigment{color White*1.1}
        finish {ambient 0.45 diffuse 0.85}
    }

    texture { Raster(RasterScale,RasterHalfLine) rotate<0,0,0> }
    texture { Raster(RasterScale,RasterHalfLine) rotate<0,90,0>}

    rotate<0,0,0>
    scale 10.0*f_grid_unit_size*(x+z)
}

#declare o_plane=
plane { 
    <0,1,0>, 0    // plane with layered textures
    texture {
        pigment{color White*1.1}
        finish {ambient 0.45 diffuse 0.85}
    }

    texture { Raster(RasterScale,RasterHalfLine*RasterHalfLine_Minor_Multiplier) scale 1.0*f_grid_unit_size_minor*(x+z) rotate<0,0,0> }
    texture { Raster(RasterScale,RasterHalfLine*RasterHalfLine_Minor_Multiplier) scale 1.0*f_grid_unit_size_minor*(x+z) rotate<0,90,0>}
    
    texture { Raster(RasterScale,RasterHalfLine*RasterHalfLine_Major_Multiplier) scale 1.0*f_grid_unit_size_major*(x+z) rotate<0,0,0> }
    texture { Raster(RasterScale,RasterHalfLine*RasterHalfLine_Major_Multiplier) scale 1.0*f_grid_unit_size_major*(x+z) rotate<0,90,0>}

    rotate<0,0,0>
//    scale 10.0*f_grid_unit_size*(x+z)
}

#ifdef(def_camera_use_custom)

/*
    object{o_plane 
        rotate x*90 
        translate f_grid_shift*z
        rotate f_camera_custom_rotation_x*x
        rotate f_camera_custom_rotation_y*y    
    
    
    }
*/
//    object{ AxisXYZ( 10, 10, 10, Texture_A_Dark, Texture_A_Light) scale 1.00 translate -0*(x+y)}

#end

#ifdef(def_show_grid)



    light_source{<1500,2500,2500> color White shadowless}
/*
    sky_sphere{ 
        pigment{
            gradient <0,1,0>
                color_map{
                    [0   color rgb<1,1,1>         ]//White
                    [0.4 color rgb<0.14,0.14,0.56>]//~Navy
                    [0.6 color rgb<0.14,0.14,0.56>]//~Navy
                    [1.0 color rgb<1,1,1>         ]//White
                }
                scale 1
            }
    }
*/


    object{o_plane}
    object{o_plane rotate x*90 translate f_grid_shift*z}
    object{o_plane rotate z*90 translate -f_grid_shift*x}


#end


#ifdef(def_show_axis)
    object{ AxisXYZ( f_axis_unit_size_major, f_axis_unit_size_major, f_axis_unit_size_major, Texture_A_Dark, Texture_A_Light, f_axis_unit_size_minor) scale 1.00 translate -0*(x+y)}
#end
