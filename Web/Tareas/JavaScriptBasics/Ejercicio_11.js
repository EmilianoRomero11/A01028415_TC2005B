function ordenAlfabetico(lista){
    let resultado = lista.sort()
    return resultado
}

let lista = ["Beta", "Gamma", "Epsilon", "Alfa", "Sigma", "Zeta"]
let ordenada = ordenAlfabetico(lista)
console.log(ordenada)