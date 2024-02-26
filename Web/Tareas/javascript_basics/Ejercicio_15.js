function ordenDescendente(arreglo){
    let ordenado = []
    arreglo.sort()
    for (i = arreglo.length-1; i>=0; i--){
        ordenado.push(arreglo[i])
    }
    return ordenado
}

let arreglo = [1,5,7,3,4,8,9,3,4,8,5]
let ordenado = ordenDescendente(arreglo)
console.log(ordenado)