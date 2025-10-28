// Create Event do Obj_player - SUBSTITUA por este código completo:

// Configuração básica
grid_size = 64;
x = 64;
y = 32;

// Sistema de sequência
move_sequence = [];
executing = false;
current_move = 0;
move_speed = 15;
move_timer = 0;
max_moves = 7;

// Sistema de personagens
personagem_atual = 0;
sprites_personagens = [spr_urso, spr_guaxinim, spr_raposa, spr_pinguim];



// Define o sprite baseado no personagem equipado
if (variable_global_exists("personagem_equipado")) {
    personagem_atual = global.personagem_equipado;
    if (personagem_atual < array_length(sprites_personagens)) {
        sprite_index = sprites_personagens[personagem_atual];
    }
}

// REMOVA ou COMENTE a função mudar_personagem antiga e substitua por:
mudar_personagem = function(indice) {
    // Esta função agora só é usada internamente
    if (indice >= 0 && indice < array_length(sprites_personagens)) {
        personagem_atual = indice;
        sprite_index = sprites_personagens[indice];
    }
}