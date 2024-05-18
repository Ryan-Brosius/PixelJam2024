shader_type canvas_item;

uniform vec4 tint : source_color = vec4(0.2, 0.6, 0.8, 1.0); // lighter blue tint
uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;
uniform float wave_speed = 1.0; // wave speed
uniform float wave_frequency = 10.0; // wave frequency
uniform float wave_amplitude = 0.01; // reduced wave amplitude

void fragment() {
    float wave_offset = TIME * wave_speed;

    vec2 wave_uv = UV + vec2(
        sin(UV.y * wave_frequency + wave_offset) * wave_amplitude,
        cos(UV.x * wave_frequency + wave_offset) * wave_amplitude
    );

    vec3 color = texture(SCREEN_TEXTURE, wave_uv).rgb;

    color = mix(color, tint.rgb, 0.1);

    COLOR = vec4(color, 1.0);
}
