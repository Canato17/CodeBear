// Obj_bt_IniciarJogo - Step Event
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        room_goto(tela_selecao_fases); // Vai direto para seleção de fases
    }
}

// Na tela inicial - Step Event de algum objeto
if (!variable_global_exists("save_carregado")) {
    if (instance_exists(Obj_save_manager)) {
        Obj_save_manager.carregar_progresso();
        global.save_carregado = true; // Marca que já carregou
    }
}


