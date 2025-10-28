// Obj_debug_moedas (Step Event)
if (keyboard_check_pressed(ord("M"))) {
    global.moedas += 50;
    show_message("+50 moedas! Total: " + string(global.moedas));
}