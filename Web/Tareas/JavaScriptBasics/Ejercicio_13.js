function cadenaFrecuente(lista){
    let frecuencia = []
    let contador = 0
    for(i = 0; i < lista.length; i++){
        for(j = i; j < lista.length; j++){
            if (lista[i] == lista[j]){
                contador += 1
            }
        }
        frecuencia.push(contador)
        contador = 0
    }
    let masFrecuente = 0
    for(k = 0; k < frecuencia.length; k++){
        if(frecuencia[k] > masFrecuente){
            masFrecuente = frecuencia[k]
        }
    }
    let resultado = 0
    for(l = 0; l < frecuencia.length; l++){
        if(frecuencia[l] == masFrecuente){
            resultado = lista[l];
        }
    }
    return resultado
}

let listaCadenas = ["hola", "hola", "adios", "hola", "saludos", "saludos", "saludos", "hola"];
let cadenaMasFrecuenteResultado = cadenaFrecuente(listaCadenas);
console.log("La cadena más frecuente es: " + cadenaMasFrecuenteResultado)
