// • O "Mão de Vaca" (Cálculo com Decisão)
// • Objetivo:** Praticar cálculos e `if/else`.
// • Enunciado: Um restaurante está dando 10% de desconto para
// contas acima de R$ 100,00. Peça o valor total da conta. Se for
// acima de 100, mostre o valor com desconto. Se for abaixo, mostre
// o valor normal.

const entrada = require("readline-sync");

const valorConta = entrada.questionFloat("Digite o valor total da conta: R$ ");

if (valorConta > 100) {
    const valorDesconto = valorConta * 0.1;
    const valorFinal = valorConta - valorDesconto;
    console.log(`Valor com desconto: R$ ${valorFinal.toFixed(2)}`);
} else {
    console.log(`Valor normal: R$ ${valorConta.toFixed(2)}`);
};