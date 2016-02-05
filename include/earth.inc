#declare tex_earth =
  texture {
    pigment { 
      image_map {  
        png "include/earthmap.png" 
        map_type 1
      }
    }
}

#macro m_earth(f_scale)
        sphere{ 0, f_scale texture{tex_earth}}
#end
