// Detecção de clique nos personagens
if (mouse_check_button_pressed(mb_left)) {
    var mx = mouse_x;
    var my = mouse_y;
    
    for (var i = 0; i < array_length(posicoes_personagens); i++) {
        var px = posicoes_personagens[i][0];
        var py = posicoes_personagens[i][1];
        
        if (point_in_rectangle(mx, my, 
            px - largura_botao/2, py - altura_botao/2,
            px + largura_botao/2, py + altura_botao/2)) {
            
            personagem_selecionado = i;
            break;
        }
    }
}

// Atualiza timer
if (timer_erro > 0) timer_erro--;

// Debug - adicionar moedas
if (keyboard_check_pressed(ord("1"))) {
    global.moedas += 50;
    show_message("+50 moedas! Total: " + string(global.moedas));
}