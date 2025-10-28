if (executing) {
    move_timer++;
    
    // Executa um movimento a cada X frames (para animação suave)
    if (move_timer >= move_speed) {
        move_timer = 0;
        
        var dir = move_sequence[current_move];
        
        // Movimento com colisão (baseado no seu código original)
        switch (dir) {
            case 0: if (!place_meeting(x + grid_size, y, Obj_wall)) x += grid_size; break; // Direita
            case 1: if (!place_meeting(x - grid_size, y, Obj_wall)) x -= grid_size; break; // Esquerda
            case 2: if (!place_meeting(x, y - grid_size, Obj_wall)) y -= grid_size; break; // Cima
            case 3: if (!place_meeting(x, y + grid_size, Obj_wall)) y += grid_size; break; // Baixo
        }
        
        current_move++;
        
        // Finaliza a sequência
//        if (current_move >= array_length(move_sequence)) {
  //          executing = false;
  //          move_sequence = [];  // Limpa a sequência
  //      }
        
        
        
       // NO Obj_player, TROQUE este bloco:
           if (current_move >= array_length(move_sequence)) {
                if (place_meeting(x, y, Obj_chegada)) {
                    // Ganhou a fase - apenas ganha moedas
                    var moedas_ganhas = 5;
                    
                    if (!variable_global_exists("moedas")) {
                        global.moedas = moedas_ganhas;
                    } else {
                        global.moedas += moedas_ganhas;
                    }
                    
                   
                    
                    // Salva progresso
                    if (instance_exists(Obj_save_manager)) {
                        with (Obj_save_manager) {
                            salvar_progresso();
                        }
                    }
                    
                    room_goto(tela_vitoria);
                } else {
                    room_goto(tela_derrota);
                }
                executing = false;

           
        }
    }
}
