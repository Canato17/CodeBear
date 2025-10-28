// Obj_tela_vitoria - Create Event (VERSÃO CORRIGIDA)
moedas_ganhas = 5;

// Garante variáveis
if (!variable_global_exists("moedas")) global.moedas = 0;
if (!variable_global_exists("personagens_desbloqueados")) {
    global.personagens_desbloqueados = [true, false, false, false];
}

// Dar moedas
global.moedas += moedas_ganhas;

// Avançar fase se necessário
if (variable_global_exists("fase_selecionada") && variable_global_exists("fase_atual")) {
    if (global.fase_selecionada >= global.fase_atual) {
        global.fase_atual = min(global.fase_atual + 1, 6);
    }
}

// CORREÇÃO: Salvamento DIRETO sem depender de objetos
var desbloqueados_str = "";
for (var i = 0; i < 4; i++) {
    desbloqueados_str += string(global.personagens_desbloqueados[i]);
    if (i < 3) desbloqueados_str += ",";
}

ini_open("save.ini");
ini_write_string("progresso", "personagens", desbloqueados_str);
ini_write_real("progresso", "moedas", global.moedas);
if (variable_global_exists("personagem_equipado")) {
    ini_write_real("progresso", "personagem_equipado", global.personagem_equipado);
} else {
    ini_write_real("progresso", "personagem_equipado", 0);
}
if (variable_global_exists("fase_atual")) {
    ini_write_real("progresso", "fase_atual", global.fase_atual);
} else {
    ini_write_real("progresso", "fase_atual", 1);
}
ini_close();

show_message("✓ Fase " + string(global.fase_selecionada) + " completa! +" + string(moedas_ganhas) + " moedas");
show_message("✓ Progresso salvo! Moedas: " + string(global.moedas));