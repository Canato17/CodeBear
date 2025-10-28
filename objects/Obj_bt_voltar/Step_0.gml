// Obj_bt_voltar - Step Event (use em várias telas)
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        room_goto(tela_selecao_fases); // Volta sempre para seleção de fases
    }
}