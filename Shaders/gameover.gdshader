shader_type canvas_item;
render_mode unshaded;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, repeat_disable, filter_nearest;
uniform float pixel_size : hint_range(1.0, 16.0, 1.0) = 5.0;
uniform float red_intensity : hint_range(0.0, 1.0) = .1;
uniform float noise_intensity : hint_range(0.0, 1.0) = 0.05;

void fragment() {
    float x = FRAGCOORD.x - mod(FRAGCOORD.x, pixel_size);
    float y = FRAGCOORD.y - mod(FRAGCOORD.y, pixel_size);
    float shift = floor(pixel_size / 2.0);
    vec4 color = texture(SCREEN_TEXTURE, vec2(x + shift, y + shift) * SCREEN_PIXEL_SIZE);

    // Add noise

    // Apply light red tint
    color.rgb = mix(color.rgb, vec3(1.0, 0.2, 0.2), red_intensity);

    COLOR = color;
}
