

if (current_move >= array_length(move_sequence)) {
    if (place_meeting(x, y, Obj_chegada)) {
        // Ganhou a fase - ganha moedas
        var moedas_ganhas = 5;
        
        // Garante que existe
        if (!variable_global_exists("moedas")) {
            global.moedas = moedas_ganhas;
        } else {
            global.moedas += moedas_ganhas;
        }
        
        show_message("Ganhou " + string(moedas_ganhas) + " moedas! ");
        
        // Salva progresso
        if (instance_exists(Obj_save_manager)) {
            Obj_save_manager.salvar_progresso();
        }
        
        room_goto(tela_vitoria);
    } else {
        room_goto(tela_derrota);
    }
    executing = false;
}