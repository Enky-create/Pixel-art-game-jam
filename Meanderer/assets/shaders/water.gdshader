//shader_type canvas_item;
//uniform sampler2D screen_texture: hint_screen_texture;
//void vertex() {
	////VERTEX.y+=sin(TIME);
//}
//uniform sampler2D noise_texture:filter_nearest, repeat_enable;
//uniform float distortion =0.01;
//uniform vec2 speed = vec2(0.5,0.2);
//uniform float strength_of_wave = 0.1;
//void fragment() {
	//vec2 uv =speed + UV *TIME;
	//vec2 noise = 2.0*texture(noise_texture,uv).rg - vec2(1.0) ;
	//COLOR = texture(TEXTURE,UV+noise*strength_of_wave);
	//COLOR*=texture(screen_texture,SCREEN_UV+noise*distortion);
//}
//
////void light() {
	//// Called for every pixel for every light affecting the CanvasItem.
	//// Uncomment to replace the default light processing function with this one.
////}
//shader_type canvas_item;
//
//uniform sampler2D screen_texture: hint_screen_texture;
//uniform sampler2D noise_texture: filter_nearest, repeat_enable;
//uniform float distortion = 0.01;
//uniform vec2 speed = vec2(0.5, 0.2);
//uniform float strength_of_wave = 0.1;
//uniform vec2 player_position;
//
//void fragment() {
    //vec2 uv = (UV + player_position * 0.1) * speed + TIME*1.5 * 0.1;
    //vec2 noise = 2.0 * texture(noise_texture, uv).rg - vec2(1.0);
//
    //vec2 smoothed_uv = UV + noise * strength_of_wave;
    //smoothed_uv = mix(UV, smoothed_uv, 0.5);
//
    //COLOR = texture(TEXTURE, smoothed_uv);
    //COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
//}
//shader_type canvas_item;
//
//uniform sampler2D screen_texture : hint_screen_texture;
//uniform sampler2D noise_texture : filter_nearest, repeat_enable;
//uniform float distortion = 0.01;
//uniform vec2 speed = vec2(0.5, 0.2);
//uniform float strength_of_wave = 0.1;
//uniform vec2 player_position;
//
//void fragment() {
    //// Используем TIME для анимации воды
    //vec2 animated_uv = UV + TIME * speed;
    //vec2 noise = texture(noise_texture, animated_uv).rg * 2.0 - vec2(1.0);
    //
    //// Добавляем влияние позиции игрока на искажения
    //vec2 player_effect = (player_position - UV) * 0.001;
    //vec2 final_uv = UV + noise * strength_of_wave + player_effect;
    //
    //COLOR = texture(TEXTURE, final_uv);
    //COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
//}
shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture;
uniform sampler2D noise_texture : filter_nearest, repeat_enable;
uniform float distortion = 0.01;
uniform vec2 speed = vec2(0.5, 0.2);
uniform float strength_of_wave = 0.1;
uniform vec2 player_position;
uniform float player_speed = 0.0;

void fragment() {
    // Используем TIME для анимации воды
    vec2 animated_uv = UV + TIME * speed;
    vec2 noise = texture(noise_texture, animated_uv).rg * 2.0 - vec2(1.0);
    
    // Добавляем влияние позиции игрока на искажения
    vec2 player_effect = (player_position - UV) * 0.001;
    vec2 final_uv = UV + noise * (strength_of_wave + player_speed * 0.1) + player_effect;
    
    COLOR = texture(TEXTURE, final_uv);
    COLOR *= texture(screen_texture, SCREEN_UV + noise * distortion);
}

