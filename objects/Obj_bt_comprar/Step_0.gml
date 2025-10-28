// Step Event do Obj_bt_comprar
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        if (instance_exists(Obj_loja)) {
            Obj_loja.comprar_personagem();
        }
    }
}