const entrada = require('readline-sync');
// Funcao que calcula 15 de desconto
function calculadoraDesconto(precoOriginal){
    return precoOriginal * 0.85; // Retorna 85% o valor (ou seja, 15% de desconto)
}

const produtos = ["Monitor", "Teclado", "Mause"];
const precos = [800, 150, 80];

console.log("=== TABELA DE PRECOS COM DSCONTO (15%) ===");

for (let i = 0; i < produtos.length; i++) {
    // Usando a mesma funcao para cada item do Array!
    let precoComDesconto = calculadoraDesconto(precos[i]);
    console.log(`${produtos[i]}: ${precos[i]} por R${precoComDesconto.toFixed(2)}`)
}

