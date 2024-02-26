function modaMediana(lista) {
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
    let moda = 0
    for(l = 0; l < frecuencia.length; l++){
        if(frecuencia[l] == masFrecuente){
            moda = lista[l];
        }
    }

    lista.sort()
    let mediana = 0
    mediana = lista[lista.length/2]
    return [moda, mediana]

}


let arreglo = [0,7,7,7,7,6,2,3,3,3,9,9,1,1,4,5,6,8]
const [moda, mediana] = modaMediana(arreglo)
console.log("La moda es: "+moda+" y la mediana es: "+mediana)