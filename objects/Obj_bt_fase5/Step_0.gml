// Step Event para Obj_bt_fase1, Obj_bt_fase2, etc.
if (mouse_check_button_pressed(mb_left)) {
    if (position_meeting(mouse_x, mouse_y, id)) {
        // Verifica se a fase está desbloqueada
        var numero_fase = 5; // Mude para 2, 3, 4... em cada botão
        
        if (global.fase_atual >= numero_fase) {
            global.fase_selecionada = numero_fase;
            
            // Vai para a fase correspondente
            switch (numero_fase) {
                case 1: room_goto(fase_1); break;
                case 2: room_goto(fase_2); break;
                case 3: room_goto(fase_3); break;
                case 4: room_goto(fase_4); break;
                case 5: room_goto(fase_5); break;
                case 6: room_goto(fase_6); break;
            }
        } else {
            show_message("Fase " + string(numero_fase) + " bloqueada! Complete a fase " + string(global.fase_atual) + " primeiro.");
        }
    }
}