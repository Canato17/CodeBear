if (!global.game_over) {
    // Para todos os sons
    //audio_stop_all();
    
    // Toca som de derrota
   // audio_play_sound(snd_lose, 1, false);
    
    // Marca o estado de game over
    global.game_over = true;
    
    // Muda para a room de restart
    room_goto(tela_derrota); // Substitua "rm_restart" pelo nome real da sua room
}