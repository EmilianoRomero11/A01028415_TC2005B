function caracterR(cadena){
    for (let i =0; i < cadena.length; i++){
        let car = cadena[i]
        let unico = true

        for (let j = 0; j < cadena.length; j++){
            if (i!== j  && cadena[j] === car){
                unico = false
            }
        }
        if (unico){
            return car;
        }
    }
    return null;
}

let cadenaEjemplo = "abacddbec"

console.log("Caracter que no se repite: " + caracterR(cadenaEjemplo))