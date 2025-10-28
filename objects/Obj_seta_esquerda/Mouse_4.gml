if (!Obj_player.executing && array_length(Obj_player.move_sequence) < Obj_player.max_moves) {
    array_push(Obj_player.move_sequence, 1);  // esquerda
    
}
