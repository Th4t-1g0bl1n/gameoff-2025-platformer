shader_type spatial;
render_mode world_vertex_coords;

uniform sampler2D albedo_tex : source_color, repeat_enable;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	ALBEDO = texture(albedo_tex, UV).rgb;
}

//void light() {
//	// Called for every pixel for every light affecting the material.
//	// Uncomment to replace the default light processing function with this one.
//}
