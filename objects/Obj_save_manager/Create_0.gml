// Obj_save_manager - Create Event (VERSÃO FINAL CORRIGIDA)

// NUNCA inicializa variáveis se já existirem - preserva o estado atual
if (!variable_global_exists("moedas")) {
    global.moedas = 0;
    
}

if (!variable_global_exists("personagens_desbloqueados")) {
    global.personagens_desbloqueados = [true, false, false, false];
    
}

if (!variable_global_exists("personagem_equipado")) {
    global.personagem_equipado = 0;
}

if (!variable_global_exists("fase_atual")) {
    global.fase_atual = 1;
}

ja_carregou = false;

function carregar_progresso() {
    // CARREGA APENAS UMA VEZ por execução do jogo
    if (!ja_carregou) {
        if (file_exists("save.ini")) {
            
            
            ini_open("save.ini");
            
            // Carrega valores do arquivo
            var moedas_salvas = ini_read_real("progresso", "moedas", global.moedas);
            var fase_salva = ini_read_real("progresso", "fase_atual", global.fase_atual);
            var equipado_salvo = ini_read_real("progresso", "personagem_equipado", global.personagem_equipado);
            
            // Carrega personagens do arquivo
            var desbloqueados_str = ini_read_string("progresso", "personagens", "");
            if (desbloqueados_str != "") {
                var partes = string_split(desbloqueados_str, ",");
                var personagens_salvos = [false, false, false, false];
                for (var i = 0; i < 4 && i < array_length(partes); i++) {
                    personagens_salvos[i] = (partes[i] == "true");
                }
                
                // ATUALIZA as variáveis globais com os valores do arquivo
                global.moedas = moedas_salvas;
                global.fase_atual = fase_salva;
                global.personagem_equipado = equipado_salvo;
                global.personagens_desbloqueados = personagens_salvos;
                
                // GARANTE que urso sempre está desbloqueado
                global.personagens_desbloqueados[0] = true;
            }
            
            ini_close();
            
            
        } else {
            show_message("Nenhum save encontrado - usando memória atual");
        }
        ja_carregou = true; // MARCA que já carregou
    } else {
        show_message("Save já foi carregado antes - mantendo dados atuais");
    }
}

function salvar_progresso() {
    
    
    var desbloqueados_str = "";
    for (var i = 0; i < 4; i++) {
        desbloqueados_str += string(global.personagens_desbloqueados[i]);
        if (i < 3) desbloqueados_str += ",";
    }
    
    ini_open("save.ini");
    ini_write_string("progresso", "personagens", desbloqueados_str);
    ini_write_real("progresso", "moedas", global.moedas);
    ini_write_real("progresso", "personagem_equipado", global.personagem_equipado);
    ini_write_real("progresso", "fase_atual", global.fase_atual);
    ini_close();
    
   
}

// CORREÇÃO: NÃO carrega automaticamente no Create
// O carregamento será feito manualmente no menu principal