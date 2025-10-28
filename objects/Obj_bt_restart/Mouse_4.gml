// Obj_bt_restart - Step Event
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        // Reinicia a fase atual
        switch (global.fase_selecionada) {
            case 1: room_goto(fase_1); break;
            case 2: room_goto(fase_2); break;
            case 3: room_goto(fase_3); break;
            case 4: room_goto(fase_4); break;
            case 5: room_goto(fase_5); break;
            case 6: room_goto(fase_6); break;
        }
    }
}