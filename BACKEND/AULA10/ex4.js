const entrada = require("readline-sync");

console.log("=== REGISTRO DE TEMPERATURAS ===");

const temperatura = [];

const quantidade = entrada.questionInt("Quantas temperaturas deseja registrar?");

for (let i= 0; i < quantidade; i++) {
    let temperaturas = entrada.questionFloat(`temperatura ${i +1}: `);
    temperatura.push(temperaturas)
}
console.log("\n--- RELATORIO ---")
console.log(`temperaturas registradas: ${temperatura.join("°C |")}°C`);
console.log(`Quantidade de temperaturas: ${temperatura.length}`);
console.log(`a primeira temperatura: ${temperatura[0]}`);
 console.log(`a ultima temperatura : ${temperatura[temperatura.length -1]}`);
console.log(`Maior temperatura: ${temperatura[0]}`);


