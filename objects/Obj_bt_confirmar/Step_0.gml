
// Step Event
if (ativo && mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        // Verifica se está na loja e se há personagem selecionado
        if (instance_exists(Obj_loja)) {
            with (Obj_loja) {
                if (personagem_selecionado != -1 && global.personagens_desbloqueados[personagem_selecionado]) {
                    // Equipa o personagem selecionado
                    personagem_equipado = personagem_selecionado;
                    global.personagem_equipado = personagem_selecionado;
                    
                    // Atualiza o player se existir
                    if (instance_exists(Obj_player)) {
                        Obj_player.personagem_atual = personagem_selecionado;
                        if (personagem_selecionado < array_length(Obj_player.sprites_personagens)) {
                            Obj_player.sprite_index = Obj_player.sprites_personagens[personagem_selecionado];
                        }
                    }
                    
                    mensagem_erro = "Personagem equipado: " + nomes_personagens[personagem_selecionado];
                    timer_erro = 120;
                    
                    // Salva o progresso
                   if (instance_exists(Obj_save_manager)) {
                        with (Obj_save_manager) {
                            salvar_progresso();
                        }
                    }
                    
                    
                } else if (personagem_selecionado == -1) {
                    mensagem_erro = "Selecione um personagem primeiro!";
                    timer_erro = 120;
                } else {
                    mensagem_erro = "Personagem não desbloqueado!";
                    timer_erro = 120;
                }
            }
        }
    }
}