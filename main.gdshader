shader_type canvas_item;

uniform vec4 color = vec4(0);

void fragment() {
    vec4 texture_color = texture(TEXTURE, UV);
    
    // Use the alpha of the original texture but the RGB from our color
    // This works best with white icons
    COLOR = vec4(color.rgb, texture_color.a);
}