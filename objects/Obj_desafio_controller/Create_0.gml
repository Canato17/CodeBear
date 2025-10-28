// Configurações do desafio
operadores = ["+", "-"];
resposta_correta = 0;
resposta_selecionada = -1;
questao_texto = "";

// Array de respostas
respostas = [];

// Posições dos botões de resposta
botoes_x = [300, 500, 300, 500];
botoes_y = [250, 250, 350, 350];

// Estado do jogo
desafio_concluido = false;
feedback_timer = 0;
feedback_texto = "";

gerar_questao = function() {
    var num1 = irandom_range(10, 99);
    var num2 = irandom_range(10, 99);
    var operador = operadores[irandom(1)];
    
    switch (operador) {
        case "+": 
            resposta_correta = num1 + num2; 
            break;
        case "-": 
            if (num1 < num2) { 
                var temp = num1; 
                num1 = num2; 
                num2 = temp; 
            }
            resposta_correta = num1 - num2; 
            break;
        
    }
    
    questao_texto = string(num1) + " " + operador + " " + string(num2) + " = ?";
    gerar_respostas();
}

gerar_respostas = function() {
    respostas = [resposta_correta];
    
    for (var i = 0; i < 3; i++) {
        var tentativas = 0;
        var resposta_errada;
        var ja_existe;
        
        ja_existe = true;
        while (ja_existe && tentativas < 10) {
            ja_existe = false;
            
            var variacao = irandom_range(5, 20) * choose(-1, 1);
            resposta_errada = resposta_correta + variacao;
            tentativas++;
            
            // Verifica se já existe no array
            for (var j = 0; j < array_length(respostas); j++) {
                if (respostas[j] == resposta_errada) {
                    ja_existe = true;
                    break;
                }
            }
            
            if (tentativas > 10) {
                resposta_errada = resposta_correta + (i + 1) * 10;
                break;
            }
        }
        
        // Se ainda existe duplicata após tentativas, força um valor único
        if (ja_existe) {
            resposta_errada = resposta_correta + (i + 1) * 15 + 7;
        }
        
        array_push(respostas, resposta_errada);
    }
    
    // EMBARALHA as respostas
    for (var i = array_length(respostas) - 1; i > 0; i--) {
        var j = irandom(i);
        var temp = respostas[i];
        respostas[i] = respostas[j];
        respostas[j] = temp;
    }
}

// Gera a primeira questão
gerar_questao();