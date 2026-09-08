const entrada = require("readline-sync");

console.log("=== SISTEMAS DE CONTROLE DE QUALIDADE ===");

const quantidadesPecas = entrada.questionInt("Quantas pecas deseja avaliar? ");

const pecas = [];
let soma = 0;

for (let i = 0; i < quantidadesPecas; i++) {
  let peso = entrada.questionFloat(`Peca ${i + 1}: `);

  pecas.push(peso);
 
}


let media = soma / pecas.length;

console.log(`\nMedia final: ${media.toFixed(1)}`);

if (media >= 4.8 && media <= 5.2) {
  console.log("STATUS FINAL: LOTE APROVADO!");
} else {
  console.log("STATUS FINAL: LOTE REPROVADO!");
}

console.log("\n--- RELATORIO DA AUDITORIA ---");

console.log(`Pesos registrados: ${pecas.join("kg | ")}kg`);