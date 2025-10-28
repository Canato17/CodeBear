// Create Event - Verificação de sprites
if (!sprite_exists(seta_direita_pequena)) {
    show_debug_message("Erro: Sprite seta_direita_pequena não encontrado!");
}

if (!sprite_exists(seta_cima_pequena)) {
    show_debug_message("Erro: Sprite seta_cima_pequena não encontrado!");
}

if (!sprite_exists(seta_esquerda_pequena)) {
    show_debug_message("Erro: Sprite seta_esquerda_pequena não encontrado!");
}

if (!sprite_exists(seta_baixo_pequena)) {
    show_debug_message("Erro: Sprite seta_baixo_pequena não encontrado!");
}


arrow_sprites = [seta_direita_pequena, seta_esquerda_pequena, seta_cima_pequena, seta_baixo_pequena];

display_x = 50;
display_y = 500;
spacing = 40;