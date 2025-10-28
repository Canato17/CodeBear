// DRAW EVENT do obj_fase_controller
if (fase_gerada) {
    // Desenha informações da fase
    draw_set_color(c_white);
    draw_text(10, 10, "Fase: " + string(room));
    draw_text(10, 30, "Movimentos: " + string(array_length(Obj_player.move_sequence)) + "/7");
    
    // Desenha grid (opcional)
    draw_set_color(make_color_rgb(50, 50, 50));
    for (var i = 0; i <= map_width; i++) {
        draw_line(0 + i * grid_size, 0, 0 + i * grid_size, 64 + map_height * grid_size);
    }
    for (var i = 0; i <= map_height; i++) {
        draw_line(0, 64 + i * grid_size, 64 + map_width * grid_size, 64 + i * grid_size);
    }
}