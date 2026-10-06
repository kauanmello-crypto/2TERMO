const fs = require('fs');

console.log("=== SISTEMA DE PERSISTENCIA: REGISTRO DE MAQUINAS ===")

const maquinasInsdustriais = [
    {id: 101, nome: "Torno Mecanico Universal", setor: "Uninagem", operacional: true},
    {id: 102, nome: "Frsadora Ferramentaria", setor: "Uninagem", operacional: false},
    {id: 103, nome: "Prensa hidraulica 50T", setor: "Estamparia", operacional: true},
    {id: 104, nome: "Compressor", setor: "Utilidades", operacional: false}
];
const dadosParaGravar = JSON.stringify(maquinasInsdustriais, null, 2);

const nomeDoArquivo = "maquina.json";
fs.writeFileSync(nomeDoArquivo, dadosParaGravar);
console.log(`\nGravacao concluida com sucesso`)
console.log(`Verificar o arquivo '${nomeDoArquivo}' gerado.`)









