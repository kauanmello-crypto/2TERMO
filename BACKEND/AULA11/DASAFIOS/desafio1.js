// • O Verificador de Votação (Básico)
// • Objetivo: Praticar `if/else` simples.
// • Enunciado: Crie um programa que peça o nome do usuário e o
// ano de nascimento. O programa deve calcular a idade e dizer se
// ele já tem idade mínima para votar (16 anos).

const entrada = require("readline-sync");

const nome = entrada.question("Digite seu nome: ");
const anoNascimento = entrada.questionInt("Digite seu ano de nascimento: ");


if (anoNascimento <= 2006) {
    console.log(`${anoNascimento}, infelizmente voce nao pode voltar.`)
} else {
    console.log(`${anoNascimento}, voce pode voltar.`);
};