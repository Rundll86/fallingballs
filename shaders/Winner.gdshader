shader_type canvas_item;
uniform int square_size : hint_range(1, 512) = 50;
void fragment() {
    vec2 local_pos = FRAGCOORD.xy;
    int col = int(local_pos.x) / square_size;
    int row = int(local_pos.y) / square_size;
    bool is_white = (mod(float(row + col), 2.0) == 0.0);
	COLOR = vec4(vec3(float(is_white)), 1.0);
}