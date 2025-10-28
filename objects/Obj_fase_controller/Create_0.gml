// Configurações do mapa
grid_size = 64;
map_width = 11;
map_height = 4;

// Zonas seguras para spawn
zonas_seguras = [
    [1, 1, 3, 3],
    [6, 1, 8, 3], 
    [1, 4, 3, 6],
    [6, 4, 8, 6]
];

// Função para converter grid para pixel
function grid_to_pixel(gx, gy) {
    return [64 + gx * 64, 64 + gy * 64];
}

// Função SIMPLIFICADA para encontrar camada válida
function encontrar_camada_valida() {
    var camadas_possiveis = ["Instances", "Main", "Objects", "Player", "Default"];
    
    // Primeiro tenta encontrar por nome
    for (var i = 0; i < array_length(camadas_possiveis); i++) {
        if (layer_exists(camadas_possiveis[i])) {
            return camadas_possiveis[i];
        }
    }
    
    // Se não encontrou por nome, pega a primeira camada que existir
    var num_camadas = layer_get_num();
    if (num_camadas > 0) {
        var primeira_camada = layer_get_name(layer_get_id(0));
        return primeira_camada;
    }
    
    return "Default"; // Fallback
}

// Função para posicionar objeto
function posicionar_objeto(obj, objetos_evitar) {
    var camada = encontrar_camada_valida();
    
    var tentativas = 0;
    var posicao_valida = false;
    var grid_x, grid_y;
    
    while (!posicao_valida && tentativas < 100) {
        var zona = zonas_seguras[irandom(array_length(zonas_seguras) - 1)];
        grid_x = irandom_range(zona[0], zona[2]);
        grid_y = irandom_range(zona[1], zona[3]);
        
        var pixel_pos = grid_to_pixel(grid_x, grid_y);
        posicao_valida = true;
        
        for (var i = 0; i < array_length(objetos_evitar); i++) {
            if (position_meeting(pixel_pos[0], pixel_pos[1], objetos_evitar[i])) {
                posicao_valida = false;
                break;
            }
        }
        
        tentativas++;
    }
    
    if (posicao_valida) {
        var pixel_pos = grid_to_pixel(grid_x, grid_y);
        return instance_create_layer(pixel_pos[0], pixel_pos[1], camada, obj);
    }
    return noone;
}

// Função de inicialização
function inicializar_fase() {
    var objetos_posicionados = [];
    
    // Posiciona urso
    var urso = posicionar_objeto(Obj_player, []);
    if (urso != noone) {
        array_push(objetos_posicionados, urso);
    }
    
    // Posiciona bandeira
    var bandeira = posicionar_objeto(Obj_chegada, [Obj_player]);
    if (bandeira != noone) {
        array_push(objetos_posicionados, bandeira);
    }
    
    // Verifica se é possível
    if (urso != noone && bandeira != noone) {
        var dist_x = abs(urso.x - bandeira.x) / grid_size;
        var dist_y = abs(urso.y - bandeira.y) / grid_size;
        var distancia_total = dist_x + dist_y;
        
        if (distancia_total <= Obj_player.max_moves) {
            return true;
        }
    }
    
    // Limpa se não deu certo
    for (var i = 0; i < array_length(objetos_posicionados); i++) {
        with (objetos_posicionados[i]) instance_destroy();
    }
    
    return false;
}

// Variáveis de controle
fase_gerada = false;
tentativas = 0;
camada_ativa = encontrar_camada_valida();