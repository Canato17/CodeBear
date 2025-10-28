// Obj_bt_menu - Step Event
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        room_goto(tela_inicio3); // Sua tela inicial
    }
}