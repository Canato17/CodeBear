
// Sprites dos personagens
sprites_personagens = [spr_urso, spr_guaxinim, spr_raposa, spr_pinguim];

// Configurações
personagem_selecionado = -1;
preco_personagens = [0, 50, 75, 100];
nomes_personagens = ["Urso", "Guaxinim", "Raposa", "Pinguim"];

posicoes_personagens = [
    [130, 210], [300, 210], [470, 210], [640, 210]
];

largura_botao = 135;
altura_botao = 180;
mensagem_erro = "";
timer_erro = 0;



// Create Event do Obj_loja - ADICIONE no início:

// GARANTE que as variáveis globais existem e urso está desbloqueado
if (!variable_global_exists("moedas")) {
    global.moedas = 0;
}

if (!variable_global_exists("personagens_desbloqueados")) {
    global.personagens_desbloqueados = [true, false, false, false];
} else {
    // CORREÇÃO: Garante que urso SEMPRE está desbloqueado
    global.personagens_desbloqueados[0] = true;
}





// Na função comprar_personagem - ADICIONE isto no final:
// Na função comprar_personagem - VERSÃO SEM SCRIPT
comprar_personagem = function() {
    if (personagem_selecionado == -1) {
        mensagem_erro = "Selecione um personagem!";
        timer_erro = 120;
        return;
    }
    
    if (global.personagens_desbloqueados[personagem_selecionado]) {
        mensagem_erro = "Personagem já desbloqueado!";
        timer_erro = 120;
        return;
    }
    
    var preco = preco_personagens[personagem_selecionado];
    
    if (global.moedas >= preco) {
        // COMPRA: modifica as variáveis GLOBAIS
        global.moedas -= preco;
        global.personagens_desbloqueados[personagem_selecionado] = true;
        
        mensagem_erro = "Compra realizada com sucesso!";
        timer_erro = 120;
        
        
        
        // CORREÇÃO: SALVA IMEDIATAMENTE de forma DIRETA
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
        
        show_message("✓ Compra salva permanentemente!");
        show_message("Moedas restantes: " + string(global.moedas));
        
    } else {
        mensagem_erro = "Moedas insuficientes!";
        timer_erro = 120;
    }
}