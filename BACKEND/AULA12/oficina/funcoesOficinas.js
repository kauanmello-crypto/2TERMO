function calcularOrcamento(precoPeca, horasTrabalho) {
    const valorHora = 85.00;
    const totalMaodeObra = horasTrabalho * valorHora;
    return precoPeca + totalMaodeObra;

}
    function valorComDesconto(valorTotal){
    return valorTotal * 0.8; 
    }




function vericarGarantia(meses) {
    if (meses <=3){
        return "Dentro da grantia"
    }else {
        return "Garantia expirada"
    }
}
module.exports = {
    calcularOrcamento,
    vericarGarantia,
    valorComDesconto
}





