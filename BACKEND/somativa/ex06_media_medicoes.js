const entrada = require("readline-sync");

const notas = [];
const quantidade = entrada.questionInt("Quantas notas deseja cadastrar? ");

for (let i = 0; i < quantidade; i++) {
    let nota = entrada.questionFloat(
        `Digite a nota ${i + 1}: `
    );

    notas.push(nota);
}

let soma = 0;
for (let i = 0; i < notas.length; i++) {
    soma += notas[i];
    
}
let media = soma / quantidade;
console.log(`Soma das notas: ${soma}: sua media e: ${media.toFixed(1)}`);