// Draw Event
draw_set_color(c_white);
draw_set_halign(fa_center);

// Título
draw_text(room_width/2, 50, "SELECIONE UMA FASE");

// Desenha os botões das fases
for (var i = 0; i < array_length(posicoes_fases); i++) {
    var px = posicoes_fases[i][0];
    var py = posicoes_fases[i][1];
    var fase_num = i + 1;
    
    // Cor baseada no status
    if (fase_num <= fases_desbloqueadas) {
        draw_set_color(#38b6ff); // Azul - desbloqueado
    } else {
        draw_set_color(#666666); // Cinza - bloqueado
    }
    
    // Botão da fase
    draw_rectangle(px - largura_botao/2, py - altura_botao/2,
                   px + largura_botao/2, py + altura_botao/2, true);
    
    // Borda
    draw_set_color(c_white);
    draw_rectangle(px - largura_botao/2, py - altura_botao/2,
                   px + largura_botao/2, py + altura_botao/2, false);
    
    // Número da fase
    draw_set_color(c_black);
    draw_text(px, py, string(fase_num));
    
    // Cadeado para fases bloqueadas
    if (fase_num > fases_desbloqueadas) {
        draw_set_color(c_white);
        draw_text(px, py + 30, "🔒");
    }
}

// Moedas no topo
if (variable_global_exists("moedas")) {
    draw_set_color(#ffcf00);
    draw_set_halign(fa_right);
    draw_text(room_width - 20, 20, "💰 " + string(global.moedas));
    draw_set_halign(fa_center);
}