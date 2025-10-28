// Draw GUI Event - Versão com debug
draw_set_color(c_black);
draw_set_alpha(0.7);
draw_rectangle(display_x - 20, display_y - 10, 
               display_x + 500, display_y + 50, true);
draw_set_alpha(1);

var sequence = Obj_player.move_sequence;
for (var i = 0; i < array_length(sequence); i++) {
    var dir = sequence[i];
    
    // Verificação de direção válida
    if (dir >= 0 && dir < 6) { //sequencia
        var spr = arrow_sprites[dir];
        if (sprite_exists(spr)) {
            draw_sprite_stretched(spr, 0, 
                                 display_x + (i * spacing) + 5,
                                 display_y + 2,
                                 32, 32); // Força tamanho 32x32
            
            
        } else {
            draw_text(display_x + (i * spacing) + 20, display_y + 20, "?");
        }
    }
}

// Slots vazios (mantido igual)
draw_set_color(make_color_rgb(100, 100, 100));
for (var i = array_length(sequence); i < 7; i++) {
    draw_rectangle(display_x + (i * spacing) + 5,
                   display_y + 5,
                   display_x + (i * spacing) + 35,
                   display_y + 35,
                   false);
}


// Display de moedas no canto superior direito
if (variable_global_exists("moedas")) {
    draw_set_color(c_yellow);
    draw_set_halign(fa_right);
    draw_text(room_width - 20, 20, "💰 " + string(global.moedas));
    draw_set_halign(fa_left);
}