
#macro m_SPL(C)
        <C,0.23*sin(7.1*C),0,(3-C)*0.05>

#end


#macro m_sun()


        #local i_start = 0;
        #local i_stop = 3;
        #local i_step = 0.025;
        #local i_inc = i_start;
        



        #local o_wave=union{
                //#local   (i_stop - i_start)/i_step + 1;    // number of specified sphere positions
                #local i_inc = i_start;
                #while(i_inc<=i_stop)
                        sphere{<m_SPL(i_inc).x,m_SPL(i_inc).y,m_SPL(i_inc).z>, m_SPL(i_inc).t }
                        cone{
                                <m_SPL(i_inc).x,m_SPL(i_inc).y,m_SPL(i_inc).z>, m_SPL(i_inc).t, 
                                <m_SPL(i_inc+i_step).x,m_SPL(i_inc+i_step).y,m_SPL(i_inc+i_step).z>, m_SPL(i_inc+i_step).t 
                        }
                        #local i_inc=i_inc+i_step;        
                #end
                sphere{<m_SPL(i_inc+i_step*0).x,m_SPL(i_inc+i_step*0).y,m_SPL(i_inc+i_step*0).z>, m_SPL(i_inc+i_step*0).t }
        }
        


        #local o_sun = union{
                #local f_step=30;
                #local f_start=f_step;
                #local f_stop=360;
                #while(f_start<=f_stop)
                        object{ o_wave pigment{color Orange} translate x*1.2 rotate x*0 rotate z*f_start}
                        #local f_start=f_start+f_step;
                #end
                sphere{ 0 1 pigment{color Orange} scale x+y+z*0.25}
                sphere{ 0 0.15 pigment{color Grey*0.005} scale 1*x+1.35*y+0.25*z  translate z*-0.25 + y*0.25 translate x*-0.25}
                sphere{ 0 0.15 pigment{color Grey*0.005} scale 1*x+1.35*y+0.25*z  translate z*-0.25 + y*0.25 translate x*0.25}
        
        }

        object{o_sun}
#end
