if (!fase_gerada) {
    if (tentativas < 5) {
        if (inicializar_fase()) {
            fase_gerada = true;
        } else {
            tentativas++;
        }
    } else {
        // Fallback - posicionamento manual garantido
        var camada = camada_ativa;
        instance_create_layer(64, 64, camada, Obj_player);
        instance_create_layer(576, 448, camada, Obj_chegada);
        fase_gerada = true;
    }
}