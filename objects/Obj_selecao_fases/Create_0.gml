// Obj_selecao_fases - Create Event (CÓDIGO CORRIGIDO)
fases_desbloqueadas = 1; // Valor padrão

// Só usa o global se ele existir, senão mantém o padrão
if (variable_global_exists("fase_atual")) {
    fases_desbloqueadas = global.fase_atual;
} else {
    global.fase_atual = 1; // Garante que existe
    fases_desbloqueadas = 1;
}

posicoes_fases = [
    [200, 200], // Fase 1
    [400, 200], // Fase 2  
    [600, 200], // Fase 3
    [200, 400], // Fase 4
    [400, 400], // Fase 5
    [600, 400]  // Fase 6
];
largura_botao = 80;
altura_botao = 80;