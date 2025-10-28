if (!desafio_concluido) {
    if (mouse_check_button_pressed(mb_left)) {
        for (var i = 0; i < 4; i++) {
            if (point_in_rectangle(mouse_x, mouse_y, 
                botoes_x[i] - 60, botoes_y[i] - 25,
                botoes_x[i] + 60, botoes_y[i] + 25)) {
                
                resposta_selecionada = i;
                desafio_concluido = true;
                feedback_timer = 90;
                    
                // No Obj_desafio_controller - No final do desafio (quando acertar)
                // No desafio, quando acertar - procure esta parte e substitua:
                if (respostas[i] == resposta_correta) {
                    feedback_texto = "✓ CORRETO! +10 Moedas";
                    global.moedas += 10;
                    
                    // SALVAMENTO DIRETO
                    var desbloqueados_str = "";
                    for (var i = 0; i < array_length(global.personagens_desbloqueados); i++) {
                        desbloqueados_str += string(global.personagens_desbloqueados[i]);
                        if (i < array_length(global.personagens_desbloqueados) - 1) desbloqueados_str += ",";
                    }
                    
                    ini_open("save.ini");
                    ini_write_string("progresso", "personagens", desbloqueados_str);
                    ini_write_real("progresso", "moedas", global.moedas);
                    ini_write_real("progresso", "personagem_equipado", global.personagem_equipado);
                    ini_write_real("progresso", "fase_atual", global.fase_atual);
                    ini_close();
                    
                    // Vai para seleção de fases após timer
                    room_goto(tela_selecao_fases);
                }
            }
        }
    }
} else {
    feedback_timer--;
    
    if (feedback_timer <= 0) {
        if (respostas[resposta_selecionada] == resposta_correta) {
            room_goto(tela_desafio_vitoria);
        } else {
            desafio_concluido = false;
            resposta_selecionada = -1;
            feedback_timer = 0;
            gerar_questao();
        }
    }
}

