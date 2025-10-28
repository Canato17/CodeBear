// Obj_bt_proximo - Step Event (na tela de vitória)
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        room_goto(tela_selecao_fases); // Vai para o desafio primeiro
    }
}