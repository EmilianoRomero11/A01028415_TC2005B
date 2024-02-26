function cadenaMasCorta(lista,n){
    let longitudes = []
    for (i = 0; i < lista.length; i++){
        cadena = lista[i]
        longitudes.push(cadena.length)
    }
    let x = longitudes[0]
    for (j = 0; j < longitudes.length; j++){
        if (longitudes[j] < x){
            x = longitudes[j]
        }
    }
    let resultado = x
    return resultado
}

let lista = ["hola", "hola mundo", "acedijunrtviundcs"]
let resultado = cadenaMasCorta(lista)
console.log("La longitud de la cadena más corta es: "+resultado)