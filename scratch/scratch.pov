//Persistence of Vision Ray Tracer Scene Description File

#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "math.inc"
#include "transforms.inc"

pigment {
	image_map {
		gif "MyFile"
		map_type 0	//planar
		interpolate 0	//none
	}
}
