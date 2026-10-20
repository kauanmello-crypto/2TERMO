const fs = require("fs");
const texto = fs.readFileSync("maquinas.json", "utf8");
const maquinas = JSON.parse(texto);
maquinas.forEach((maquina, indice) => {
console.log(`${indice + 1}. ${maquina.nome}`);
});

// mostrar nome, setor em cada linha
maquinas.forEach((maquina) => {
  console.log(`${maquina.nome} - ${maquina.setor}`);
});

// mostrar a situacao da maquina
maquinas.forEach((maquina) => {
  console.log(`${maquina.nome} - ${maquina.setor} | Situação: ${maquina.situacao}`);
});

// O método find() id existente
// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);

// registro inexistente
const procurada = maquinas.find(maquina => maquina.id === 99);
console.log(procurada);  undefined

// // // consulta segura
// if (procurada !== undefined) {
// console.log(procurada.nome);
// } else {
// console.log("Máquina não encontrada.");
// }

// //  Selecionar vários registros com filter()
// const emManutencao = maquinas.filter(
// maquina => maquina.status === "Manutenção"
// );
// console.log(emManutencao.length);
// console.log(emManutencao);

// // Teste sem resultados
// const paradas = maquinas.filter(maquina => maquina.status === "Parada");
// console.log(paradas); // []
// console.log(paradas.length); // 0