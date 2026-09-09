// 2. ☐ Importar a biblioteca readline-sync.
// ☐ Solicitar ao usuário o nome do material.
// ☐ Solicitar a quantidade comprada.
// ☐ Solicitar o preço unitário.
// ☐ Calcular o valor total da compra.
// ☐ Exibir um pequeno resumo da compra.

const entrada =  require('readline-sync');

const nomeMaterial = entrada.question("Qual o nome do material? ");
const precoUnitario = entrada.questionFloat("Qual o preco unitario? ");
const quantidade = entrada.questionInt("Quantas quantidades foram compradas? ");


const total = precoUnitario * quantidade;


console.log(`Produto: ${nomeMaterial}`);
console.log(`Total a pagar: R$ ${total.toFixed(2)}`);         