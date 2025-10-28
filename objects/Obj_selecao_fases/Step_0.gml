// Step Event
if (mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < array_length(posicoes_fases); i++) {
        var px = posicoes_fases[i][0];
        var py = posicoes_fases[i][1];
        
        // Verifica clique e se a fase está desbloqueada
        if (point_in_rectangle(mouse_x, mouse_y, 
            px - largura_botao/2, py - altura_botao/2,
            px + largura_botao/2, py + altura_botao/2)) {
            
            if (i + 1 <= fases_desbloqueadas) {
                global.fase_selecionada = i + 1;
                
                // Vai para a fase selecionada
                switch (i + 1) {
                    case 1: room_goto(fase_1); break;
                    case 2: room_goto(fase_2); break;
                    case 3: room_goto(fase_3); break;
                    case 4: room_goto(fase_4); break;
                    case 5: room_goto(fase_5); break;
                    case 6: room_goto(fase_6); break;
                }
            }
        }
    }
}