// 3. ☐ Solicitar o peso da peça.
// ☐ Usar if/else para decidir se a peça está dentro do padrão.
// ☐ Exibir &#39;PEÇA APROVADA&#39; quando estiver entre 95 e 105 g.
// ☐ Exibir &#39;PEÇA REPROVADA&#39; nos demais casos.
// ☐ Exibir também o peso informado.


const entrada = require('readline-sync');

const peso = entrada.question("Informe o peso da peca: ");

if (peso >= 95 && peso <= 105) {    
    console.log('PEÇA APROVADA');
} else {
    console.log('PEÇA REPROVADA');
}