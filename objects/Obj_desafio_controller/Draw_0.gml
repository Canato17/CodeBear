// Questão
draw_text(room_width/2.3, 150, questao_texto);

// Botões de resposta
for (var i = 0; i < 4; i++) {
    var cor_botao = #38b6ff;
    var cor_texto = #ffcf00;
    
    if (resposta_selecionada == i) {
        if (desafio_concluido) {
            // CORREÇÃO: substituindo operador ternário por if/else
            if (respostas[i] == resposta_correta) {
                cor_botao = c_green;
            } else {
                cor_botao = c_red;
            }
            cor_texto = c_black;
        } else {
            cor_botao = #ffcf00;
            cor_texto = c_black;
        }
    }
    
    draw_set_color(cor_botao);
    draw_rectangle(botoes_x[i] - 60, botoes_y[i] - 25, 
                   botoes_x[i] + 60, botoes_y[i] + 25, true);
    
    draw_set_color(#5fcaff);
    draw_rectangle(botoes_x[i] - 60, botoes_y[i] - 25, 
                   botoes_x[i] + 60, botoes_y[i] + 25, false);
    
    draw_set_color(cor_texto);
    draw_set_halign(fa_center);
    draw_text(botoes_x[i], botoes_y[i], string(respostas[i]));
}

// Feedback visual
if (feedback_timer > 0) {
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text(room_width/2, 280, feedback_texto);
}

// Reset
draw_set_halign(fa_left);
draw_set_color(c_black);