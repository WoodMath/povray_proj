
//#declare factorial = function(C) { prod(i, 1, C, max(i,1)) }
//#declare binom = function(n,k) { factorial(n)/factorial(k)/factorial(n-k) }
//#declare coef = function(n,k,p) { binom(n,k)*pow(p,k)*pow(1-p,n-k) }
//#declare d_coef_dp = function(n,k,p) { binom(n,k)*(k*pow(p,k-1)*pow(1-p,n-k)+pow(p,k)*-1*(n-k)*pow(1-p,n-k-1)) }
#declare bezier_basis = function(b0,b1,b2,b3,p) { pow(1-p,3)*b0 + 3*pow(1-p,2)*pow(p,1)*b1 + 3*pow(1-p,1)*pow(p,2)*b2 + pow(p,3)*b3 }
#declare d_bezier_basis_dp = function(b0,b1,b2,b3,p) { 
                        -3*pow(1-p,2)*b0 + 
                        3*(-2*pow(1-p,1)*pow(p,1)+pow(1-p,2))*b1 + 
                        3*(pow(p,2)+2*pow(1-p,1)*pow(p,1))*b2 + 
                        3*pow(p,2)*b3 
                }
#declare linterpolate = function(p0,p1,p) { p0*(1-p)+p1*p }

#macro bezier_basis_p(v0,v1,v2,v3,p)

#ifdef(DEBUG)
	#debug concat(" p = ",str(p,10,5),"\n")
	#debug concat(" v0 = ",vstr(4,v0,",",0,5),"\n")
	#debug concat(" v1 = ",vstr(4,v1,",",0,5),"\n")
	#debug concat(" v2 = ",vstr(4,v2,",",0,5),"\n")
	#debug concat(" v4 = ",vstr(4,v2,",",0,5),"\n")
#end
        #local return = <0,0,0,0>;
#ifdef(DEBUG)
	#debug concat(" return = ",vstr(4,return,",",0,5),"\n")
#end
        #local return = return+bezier_basis(v0.x,v1.x,v2.x,v3.x,p)*x;
#ifdef(DEBUG)
	#debug concat(" return = ",vstr(4,return,",",0,5),"\n")
#end
        #local return = return+bezier_basis(v0.y,v1.y,v2.y,v3.y,p)*y;
#ifdef(DEBUG)
	#debug concat(" return = ",vstr(4,return,",",0,5),"\n")
#end
        #local return = return+bezier_basis(v0.z,v1.z,v2.z,v3.z,p)*z;
#ifdef(DEBUG)
	#debug concat(" return = ",vstr(4,return,",",0,5),"\n")
#end
        #local return = return+bezier_basis(v0.t,v1.t,v2.t,v3.t,p)*t;
#ifdef(DEBUG)
	#debug concat(" return = ",vstr(4,return,",",0,5),"\n")
#end
        return; 
        
#end

#macro bezier_basis_control_point(v0,v1,v2,v3,si)
        merge{
                sphere{v0, 1.25*si  }
                sphere{v1, 1.25*si  }
                sphere{v2, 1.25*si  }
                sphere{v3, 1.25*si  }
                cylinder{v0, v1, 0.75*si}
                cylinder{v1, v2, 0.75*si}
                cylinder{v2, v3, 0.75*si}
                
        }
        

#end

#macro bezier_basis_vector(v0,v1,v2,v3)
        #local f_start = 0;
        #local f_stop = 1;
        #local f_inc = f_start;        
        #local f_step = 0.05;
        #local o_bezier=merge{
                //#local   (i_stop - i_start)/i_step + 1;    // number of specified sphere positions
                #local f_inc = f_start;
                #while(f_inc<f_stop)
                        #local v_pos_1 = bezier_basis_p(v0,v1,v2,v3,f_inc)
                        #local v_pos_2 = bezier_basis_p(v0,v1,v2,v3,f_inc+f_step)
                        
                       sphere{<v_pos_1.x,v_pos_1.y,v_pos_1.z>, v_pos_1.t  }
                       cone{
                                <v_pos_1.x,v_pos_1.y,v_pos_1.z>, v_pos_1.t,
                                <v_pos_2.x,v_pos_2.y,v_pos_2.z>, v_pos_2.t

                        }
                        #local f_inc=f_inc+f_step;
        
                #end
                sphere{ <v_pos_2.x,v_pos_2.y,v_pos_2.z>, v_pos_2.t    }
        }
//        object{o_bezier pigment{color Yellow}}
        object{o_bezier }
#end

#macro bezier_basis_vector_n(v0,v1,v2,v3,n)
        #local f_start = 0;
        #local f_stop = 1;
        #local f_inc = f_start;        
        #local f_step = 1/pow(2,n);
        #local o_bezier=merge{
                //#local   (i_stop - i_start)/i_step + 1;    // number of specified sphere positions
                #local f_inc = f_start;
                #while(f_inc<f_stop)
                        #local v_pos_1 = bezier_basis_p(v0,v1,v2,v3,f_inc)
                        #local v_pos_2 = bezier_basis_p(v0,v1,v2,v3,f_inc+f_step)
                        
                       sphere{<v_pos_1.x,v_pos_1.y,v_pos_1.z>, v_pos_1.t  }
                       cone{
                                <v_pos_1.x,v_pos_1.y,v_pos_1.z>, v_pos_1.t,
                                <v_pos_2.x,v_pos_2.y,v_pos_2.z>, v_pos_2.t

                        }
                        #local f_inc=f_inc+f_step;
#ifdef(DEBUG)
			#debug concat(" f_inc = ",str(f_inc,10,5),"\n")
			#debug concat(" f_step = ",str(f_step,10,5),"\n")
			#debug concat(" f_inc + f_step = ",str(f_inc+f_step,10,5),"\n")
			#debug concat(" v_pos_1 = ",vstr(4,v_pos_1,",",0,5),"\n")
			#debug concat(" v_pos_2 = ",vstr(4,v_pos_2,",",0,5),"\n")
#end
        
                #end
                sphere{ <v_pos_2.x,v_pos_2.y,v_pos_2.z>, v_pos_2.t    }
        }
#ifdef(DEBUG)
	#debug concat(" v0 = ",vstr(4,v0,",",0,5),"\n")
	#debug concat(" v1 = ",vstr(4,v1,",",0,5),"\n")
	#debug concat(" v2 = ",vstr(4,v2,",",0,5),"\n")
	#debug concat(" v3 = ",vstr(4,v3,",",0,5),"\n")
#end
//        object{o_bezier pigment{color Yellow}}
        object{o_bezier }
#end
