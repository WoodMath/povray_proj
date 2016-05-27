#include "colors.inc"
//#include "mathdraw.inc"

//#declare fctr = 1;
#declare ev=7.25;
#declare ev2=7;
#declare spread=1;
#declare rad=.05;
#declare dist=50;
#declare min_pos=-5;
#declare max_pos=5;
#declare num_count=dist/spread;
#declare pseudo_push=0.01;
#declare push=5/pow(1*pow(ev,2),0.5);



///*
camera {
 orthographic
 location z*-5*1+x*25*0+y*5*0-z*8*0
// direction z*1
 look_at 0+y*5*0
 right x*10
 up y*10
 
}

#declare light_cube=box{min_pos max_pos scale z*0.2 translate z*-3}

light_source {
 z*-5
  
 color White
 parallel    
// area_light <5, 0, 0>, <0, 0, 5>, 5, 5
// adaptive 1
// jitter
// spotlight
// radius 30.00
// falloff 45.00
// tightness 00
// point_at 0
 shadowless
 projected_through { box{min_pos max_pos scale z*0.2+(x+y) translate z*-3} }
}
//*/

//cylinder{<-spread-0.5,0,0>,<spread+0.5,0,0> rad pigment{color Green} finish{ambient 1}}
//cylinder{<-spread-0.5,0,spread>,<spread+0.5,0,spread> rad pigment{color Green} finish{ambient 1}} 
//cylinder{<0,0,-spread-0.5>,<0,0,spread+0.5> rad pigment{color Green} finish{ambient 1}}
//cylinder{<spread,0,-spread-0.5>,<spread,0,spread+0.5> rad pigment{color Green} finish{ambient 1}} 

#declare cyl=cylinder{<min_pos-0.5,0,0>,<max_pos+0.5,0,0> rad pigment{color Green} finish{ambient 0.1}  }
#declare edge_cyl=cylinder{<0,min_pos-0.5,0>,<0,max_pos+0.5,0> rad*2.5  pigment { color Green*1} finish{ambient 0.8  } }
#declare edge_cyl_highlight=cylinder{
        <0,min_pos-0.5,0>,<0,max_pos+0.5,0> rad*1  
                hollow 
                interior{media{emission y*2 density{function{pow(1-pow(pow(x,2),0.5)*1,100)}}}}  
                pigment { color Green*1 transmit 1.0} scale x*25+z*5 
 //               finish{ambient 0.5 diffuse 0.0 reflection 1.0} 
 }

#declare o_square = union{
        object{cyl rotate y*0 translate z*0}
        object{cyl rotate y*-90 translate x*0}
        object{cyl rotate y*0 translate z*spread}
        object{cyl rotate y*-90 translate x*spread}
}
///*
merge{

        object{edge_cyl rotate z*0 translate x*min_pos }
        object{edge_cyl rotate z*-90 translate y*min_pos }
        object{edge_cyl rotate z*0 translate x*max_pos }
        object{edge_cyl rotate z*-90 translate y*max_pos }

///*
        object{edge_cyl_highlight rotate z*0 translate x*min_pos }
        object{edge_cyl_highlight rotate z*-90 translate y*min_pos }
        object{edge_cyl_highlight rotate z*0 translate x*max_pos }
        object{edge_cyl_highlight rotate z*-90 translate y*max_pos }
//*/
//        scale z*1
//        hollow   
 



}
//*/

#declare ten_by_ten=union{

        #local i=min_pos;
        #while(i<=max_pos)
                object{cyl rotate z*0 translate y*i }
                object{cyl rotate z*-90 translate x*i }
        
                #local i=i+spread;
        #end

}
object{ten_by_ten}
