const entrada = require('readline-sync');
const oficina = require('./funcoesOficinas');

console.log("=== SISTEMA DE GESTAO DE OFICINA 1.0 ===");

const peca = entrada.questionFloat("Preco da peca: R$");
const horas = entrada.questionFloat("horas de servicos: ");
const tempoUso = entrada.questionFloat("meses desde o ultimo conserto: ");


const total = oficina.calcularOrcamento(peca, horas);
const garantia = oficina.vericarGarantia(tempoUso);
const orcamentoComDesconto = oficina.valorComDesconto(total);

console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Status Garantia: ${garantia}`);
console.log(`orcamento com 20% de desconto: R$ ${orcamentoComDesconto.toFixed(2)}`);

console.log("------------------------------------------");
