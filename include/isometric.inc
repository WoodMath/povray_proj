#include "math.inc"
#include "transforms.inc"


 /*
//#declare CameraDistance = 5;
#declare f_camera_clipping_distance = 2;                        //      change if corners are clipped
#declare f_camera_area_distance = 5/2;                          //      distance that afffects picture size
#declare f_camera_size = 3;
#declare f_camera_skewed = 0.7;
#declare f_aspect_ratio = image_width/image_height;



#declare c_isometric=camera
{
 orthographic
 location -z*(f_camera_clipping_distance)
 direction z*(f_camera_clipping_distance)
 up y*f_camera_area_distance*f_camera_size
 right x*f_camera_area_distance*f_camera_size*f_aspect_ratio
 rotate <asind(tand(30)),45,0>
}
*/

#macro camera_isometric(f_camera_clipping_distance,f_camera_area_distance,f_camera_size,f_translate)
        #local f_camera_skewed = 0.7;
        #local f_aspect_ratio = image_width/image_height;


        camera{
		orthographic
		location -z*(f_camera_clipping_distance)
		direction z*(f_camera_clipping_distance)
		up y*f_camera_area_distance*f_camera_size
		right x*f_camera_area_distance*f_camera_size*f_aspect_ratio
		rotate <asind(tand(30)),45,0>
		translate f_translate
        }
#end
