//with (Obj_player) {
//    if (!is_moving) {  // Só verifica se não está em movimento
//        var new_x = x;  // Calcula nova posição
//        var new_y = y - grid_size;
        
        // Verifica colisão na nova posição
//        if (!place_meeting(new_x, new_y, Obj_wall)) {
//            target_x = new_x;  // Atualiza destino
//            target_y = new_y;
//            is_moving = true;  // Inicia movimento
            
            // Opcional: som de movimento
//            audio_play_sound(snd_step, 1, false);
//        } //else {
            // Opcional: som de colisão
          //  audio_play_sound(snd_bump, 1, false);
        //}
//    }
//}

if (!Obj_player.executing && array_length(Obj_player.move_sequence) < Obj_player.max_moves) {
    array_push(Obj_player.move_sequence, 2);  // 2 = cima
    
}
