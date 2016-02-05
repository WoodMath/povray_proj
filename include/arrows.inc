

#include "colors.inc"
#include "math.inc"                   



#macro o_arrow(p1,p2,f_arrow_radius_minor,f_arrow_radius_major)

        #local f_arrow_radius = f_arrow_radius_minor;
        #local f_arrow_head_length = f_arrow_radius_minor*5;
        
        #if(!VEq(p1,<0,0,0>))
                #local u1=p1/vlength(p1);
        #else
                #local u1=p1;
        #end
        #if(!VEq(p2,<0,0,0>))                        
                #local u2=p2/vlength(p2);
        #else
                #local u2=p2;
        #end

//        #if(VEq(u1,u2)|VEq(p1,p2))
        #if(VEq(p1,p2))

                sphere{p1, f_arrow_radius}
//               #debug " Missing objects \n"
               #local i_major = 10;
               #local i_minor = 5;
               
//               #debug concat(" u1 = ", "<", str(u1.x,i_major,i_minor), ",", str(u1.y,i_major,i_minor), ",", str(u1.z,i_major,i_minor), ">","\n")
//               #debug concat(" u2 = ", "<", str(u2.x,i_major,i_minor), ",", str(u2.y,i_major,i_minor), ",", str(u2.z,i_major,i_minor), ">","\n")
//               #debug concat(" p1 = ", "<", str(p1.x,i_major,i_minor), ",", str(p1.y,i_major,i_minor), ",", str(p1.z,i_major,i_minor), ">","\n")
//               #debug concat(" p2 = ", "<", str(p2.x,i_major,i_minor), ",", str(p2.y,i_major,i_minor), ",", str(p2.z,i_major,i_minor), ">","\n")

                
        #else               
                #local f_arrow_length = vlength(p2-p1);
                #local f_arrow_length = max(f_arrow_length,f_arrow_head_length);
                #local f_head_perc_length = f_arrow_head_length / f_arrow_length;

                #local obj_arrow=
                merge{
                        sphere{p1,f_arrow_radius}
                        #if(f_head_perc_length<1)                       
                               cylinder{p1,p1+(p2-p1)*(1-f_head_perc_length),f_arrow_radius}
                        #end
                        cone{
                                p1+(p2-p1)*(1-f_head_perc_length),f_arrow_radius*2.5,
                                p2, f_arrow_radius // 0.0001
                        }
                        sphere{p2,f_arrow_radius}
                }
                object{obj_arrow} 
//               #debug " Not Missing objects \n"

        #end
        
#end 

