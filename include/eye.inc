


/*
#declare f_x_sphere = function(u,v){-cos(2*pi*u)*sin(pi*v)}
#declare f_y_sphere = function(u,v){-cos(pi*v)}
#declare f_z_sphere = function(u,v){-sin(2*pi*u)*sin(pi*v)}

#declare f_u_sphere = function(u,v){u}
#declare f_v_sphere = function(u,v){v}



//#declare f_x_sphere = function(u,v){u}
//#declare f_y_sphere = function(u,v){v}
//#declare f_z_sphere = function(u,v){0.5}


#declare o_parametric_sphere=
parametric{
        function{f_x_sphere(u,v)}
        function{f_y_sphere(u,v)}
        function{f_z_sphere(u,v)}
        
        <0,0>,<1,1>
        accuracy 0.1                
        contained_by{sphere{0,1.1}}
//        contained_by{box{0,1}}

        max_gradient 5
//        uv_mapping texture{t_eye} rotate y*0
//        texture{uv_mapping t_test} rotate y*0
        texture{t_test} rotate y*0

}
*/


/*
#declare u_div=200;
#declare v_div=100;

#declare u_inc = 1/u_div;
#declare v_inc = 1/v_div;

#declare u_step = 0;
#declare v_step = 0;


#declare o_mesh =
mesh{

        #while(u_step<1)
                #declare u_prev = u_step;
                #declare u_step = u_step + u_inc;
        
                #declare v_step = 0;
                #while(v_step<1)
                        #declare v_prev = v_step;                      
                        #declare v_step = v_step + v_inc;
                        
                        #declare xyz_uv_00 = <f_x_sphere(u_prev,v_prev),f_y_sphere(u_prev,v_prev),f_z_sphere(u_prev,v_prev)>;
                        #declare xyz_uv_01 = <f_x_sphere(u_prev,v_step),f_y_sphere(u_prev,v_step),f_z_sphere(u_prev,v_step)>;
                        #declare xyz_uv_10 = <f_x_sphere(u_step,v_prev),f_y_sphere(u_step,v_prev),f_z_sphere(u_step,v_prev)>;
                        #declare xyz_uv_11 = <f_x_sphere(u_step,v_step),f_y_sphere(u_step,v_step),f_z_sphere(u_step,v_step)>;

                        #declare uv_uv_00 = <f_u_sphere(u_prev,v_prev),f_v_sphere(u_prev,v_prev)>;
                        #declare uv_uv_01 = <f_u_sphere(u_prev,v_step),f_v_sphere(u_prev,v_step)>;
                        #declare uv_uv_10 = <f_u_sphere(u_step,v_prev),f_v_sphere(u_step,v_prev)>;
                        #declare uv_uv_11 = <f_u_sphere(u_step,v_step),f_v_sphere(u_step,v_step)>;

 
//                        #debug vstr(3,xyz_uv_00,",",0,1)
//                        #debug "\n"
                        

                              
                        triangle{ xyz_uv_00, xyz_uv_01, xyz_uv_10 uv_vectors uv_uv_00, uv_uv_01, uv_uv_10 texture{t_use} }
                        triangle{ xyz_uv_01, xyz_uv_10, xyz_uv_11 uv_vectors uv_uv_01, uv_uv_10, uv_uv_11 texture{t_use} }
                         
                #end
        
        #end
}


*/


/*


#declare v_box_pos=<0,0,-1>;
#declare f_width=1.0;
#declare f_thick=0.05;


#declare t_test =
  texture {
    pigment { 
      image_map {  
        png "povmap.png" 
        map_type 1
      }
    }
}


#declare t_eye=
  texture{
    pigment{
      image_map {
        png "povmap.png" 
      }
  }
}

  
#declare t_eye_0 =  
  texture {
    pigment {
      image_map {
        png "1000_eye.png" 
        map_type 0
      }
    }
    finish { ambient 0.3 } 
}

  
#declare t_eye_1 =  
  texture {
    pigment {
      image_map {
        png "1000_eye.png" 
        map_type 1
      }
      scale x*1+y*1+z*1
    }
    finish { ambient 0.3 } 
}

#declare t_eye_2 =  
  texture {
    pigment {
      image_map {
        png "1000_eye_2x.png" 
        map_type 1
      }
      scale x*1+y*1+z*1
    }
    finish { ambient 0.3 } 
}

#declare t_use = texture{t_eye_0 scale f_scale*(x+y)+z scale 2*(x+y+0.5*z) translate -f_scale*(x+y)};

#declare o_sphere = 
sphere{0,1 texture{t_use}}





*/

#local f_scale=1.25;

#local f_bezier_basis = function(b0,b1,b2,b3,p) { pow(1-p,3)*b0 + 3*pow(1-p,2)*pow(p,1)*b1 + 3*pow(1-p,1)*pow(p,2)*b2 + pow(p,3)*b3 }


#macro eye_bezier_sweep(v0,v1,v2,v3,n)


        #declare o_sweep = union{
                #local i_start = 0;
                #local i_stop = 1;
                #local i_div = pow(2,n);
                #local f_step = (i_stop-i_start)/i_div;
                
                #local i_inc = 0;
                
                #while (i_inc<i_stop)
                        #local i_inc = i_inc+f_step;
                        #local xyzt_use = <0,0,0,0>;
                        #local xyzt_use = xyzt_use + f_bezier_basis(v0.x,v1.x,v2.x,v3.x,i_inc)*x;    
                        #local xyzt_use = xyzt_use + f_bezier_basis(v0.y,v1.y,v2.y,v3.y,i_inc)*y;    
                        #local xyzt_use = xyzt_use + f_bezier_basis(v0.z,v1.z,v2.z,v3.z,i_inc)*z;    
                        #local xyzt_use = xyzt_use + f_bezier_basis(v0.t,v1.t,v2.t,v3.t,i_inc)*t;    
                        
                        sphere{ 0, 1 texture{t_use} scale (xyzt_use.t)*(x+y+z) rotate y*-90 translate <xyzt_use.x,xyzt_use.y,xyzt_use.z> }
                         
                #end        
        }
        object{ o_sweep}                


#end


#declare pig_eye =
pigment{
      image_map {
        png "include/1000_eye.png" 
        map_type 0

      }
      scale f_scale*(x+y)+z scale 2*(x+y+0.5*z) translate -f_scale*(x+y) rotate y*-90
}


#declare tex_eye =
texture{
        gradient x
        texture_map{
                [0.00 pigment{color White} ]
                [0.08 pigment{color White} ]
                [0.25 pigment{pig_eye}       ]       
                [1.00 pigment{pig_eye}       ]
                
        }
        scale x*2 translate x*-1
}               


#macro eye_function_sweep(t0,t1,n)
        
         
        #local f_extend = 5.0;
        #local f_rad = 0.01;

        #local f_x_t = function(f_t){f_t}
        #local f_y_t = function(f_t){f_t*sin(f_t)/2/pi}
        #local f_z_t = function(f_t){0}
        #local f_r_t = function(f_t){pow(f_t,2)/2/pow(2*pi,2)}

        #local o_sweep = union{
                #local i_start = t0;
                #local i_stop = t1;
                #local i_div = pow(2,n);
                #local f_step = (i_stop-i_start)/i_div;
                
                #local i_inc = i_start;
                
                #while (i_inc<i_stop)
                        #local i_inc = i_inc+f_step;
                        #local xyzt_use = <0,0,0,0>;
                        #local xyzt_use = xyzt_use + f_x_t(i_inc)*x;    
                        #local xyzt_use = xyzt_use + f_y_t(i_inc)*y;    
                        #local xyzt_use = xyzt_use + f_z_t(i_inc)*z;    
                        #local xyzt_use = xyzt_use + f_r_t(i_inc)*t;    // Radius    
                        
                        sphere{ 0, 1 texture{tex_eye} scale (xyzt_use.t) rotate y*0 translate <xyzt_use.x,xyzt_use.y,xyzt_use.z> }
                         
                #end        
        }
        object{ o_sweep}                


#end


#macro m_eye_fish(f_scale)

        #local o_eye=union{
        
                object{ eye_function_sweep(0*pi,2*pi,8) }

                sphere{ 0, 1 texture{tex_eye} 
                        translate 2*pi*x*1.0}
                
        }
        
        object{ o_eye translate -2*pi*x scale f_scale no_shadow }
        
#end                     


