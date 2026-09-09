// 4. ☐ Até 60 °C: situação NORMAL.
// ☐ De 61 °C até 80 °C: situação ATENÇÃO.
// ☐ Acima de 80 °C: situação CRÍTICA.
// ☐ Solicitar a temperatura pelo terminal.
// ☐ Exibir a temperatura e a classificação.

const entrada = require('readline-sync');


const TempMaquina = entrada.question("Qual e a temperatura da maquina? ");

if (TempMaquina <=60) {
    console.log("NORMAL");

} else if (TempMaquina >61 && TempMaquina <= 80) {
    console.log("ATENCAO");

}  if (TempMaquina >=80) {
    console.log("CRITICA");

}

console.log(`A temperatura da maquina e: ${TempMaquina}°C`);
    