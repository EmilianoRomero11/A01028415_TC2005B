function quitaDuplicados(arreglo){
    let resultado = []
    for (i = 0; i < arreglo.length; i++){
        if (resultado.includes(arreglo[i]) == false){
            resultado.push(arreglo[i])
        }
    }
    return resultado
}

let arreglo = [0,1,2,1,0,0,3,1,2,6]
let resultado = quitaDuplicados(arreglo)
console.log(resultado)