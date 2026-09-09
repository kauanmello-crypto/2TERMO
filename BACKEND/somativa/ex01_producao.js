// 1. ☐ Criar uma variável com a quantidade de peças produzidas por hora.
// ☐ Criar uma variável com a quantidade de horas do turno.
// ☐ Calcular a produção total do turno.
// ☐ Exibir uma frase informando a produção por hora, as horas e o total produzido

const quantidadePecasPorHora = 120; 
const quantidadeHorasTurno = 8; 
const producaoTotalTurno = quantidadePecasPorHora * quantidadeHorasTurno;

console.log(`A quantidade de peca produzadas por horas e ${quantidadePecasPorHora} pecas`);
console.log(`As peca foram produzidas em ${quantidadeHorasTurno} horas`);
console.log(`O valor total de pecas produzidas e  ${producaoTotalTurno} pecas`);

