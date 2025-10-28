if (!Obj_player.executing && array_length(Obj_player.move_sequence) > 0) {
    Obj_player.executing = true;
    Obj_player.current_move = 0;
}

