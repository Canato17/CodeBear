// Draw Event do Obj_loja - VERSÃO CORRIGIDA
draw_set_color(c_white);
draw_set_halign(fa_center);

// Display de moedas no topo
draw_set_color(#ffcf00);
draw_text(650, 12, "MOEDAS: " + string(global.moedas));

// Desenha os personagens
for (var i = 0; i < array_length(posicoes_personagens); i++) {
    var px = posicoes_personagens[i][0];
    var py = posicoes_personagens[i][1];
    
    // CORREÇÃO: Use SEMPRE a variável GLOBAL para verificar desbloqueio
    var personagem_desbloqueado = global.personagens_desbloqueados[i];
    
    // Fundo do card
    if (personagem_selecionado == i) {
        draw_set_color(#38b6ff);
        draw_rectangle(px - largura_botao/2, py - altura_botao/2,
                       px + largura_botao/2, py + altura_botao/2, false);
    } else if (!personagem_desbloqueado) {
        draw_set_color(#277FB3);
        draw_rectangle(px - largura_botao/2, py - altura_botao/2,
                       px + largura_botao/2, py + altura_botao/2, false);
    } else {
        draw_set_color(#38b6ff);
        draw_rectangle(px - largura_botao/2, py - altura_botao/2,
                       px + largura_botao/2, py + altura_botao/2, false);
    }
    
    // Nome do personagem
    draw_set_color(c_white);
    draw_text(px, py - 80, nomes_personagens[i]);
    
    // SPRITE - CORREÇÃO: Use a variável correta
    if (i < array_length(sprites_personagens) && sprite_exists(sprites_personagens[i])) {
        var sprite_x = px;
        var sprite_y = py - 10;
        
        if (!personagem_desbloqueado) {
            // BLOQUEADO - escuro
            draw_sprite_ext(sprites_personagens[i], 0, sprite_x, sprite_y, 1, 1, 0, c_gray, 0.5);
        } else {
            // DESBLOQUEADO - normal e COLORIDO
            draw_sprite_ext(sprites_personagens[i], 0, sprite_x, sprite_y, 1, 1, 0, c_white, 1.0);
        }
    }
    
    // Preço ou status - CORREÇÃO: Use a variável correta
    if (personagem_desbloqueado) {
        draw_set_color(c_green);
        draw_text(px, py + 70, "✓ DESBLOQUEADO");
    } else {
        draw_set_color(#ffcf00);
        draw_text(px, py + 70, string(preco_personagens[i]) + " MOEDAS");
    }
}


// Informação do personagem equipado atual
draw_set_color(c_green);
if (variable_global_exists("personagem_equipado")) {
    draw_text(room_width/2, 350, "Atualmente equipado: " + nomes_personagens[global.personagem_equipado]);
} else {
    draw_text(room_width/2, 350, "Atualmente equipado: " + nomes_personagens[0]);
}

// Mensagem de erro/feedback
if (timer_erro > 0) {
    draw_set_color(c_red);
    draw_text(room_width/2, 480, mensagem_erro);
}

// Botão de voltar para atualizar visual
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(room_width/2, 520, "Clique em VOLTAR para sair da loja");