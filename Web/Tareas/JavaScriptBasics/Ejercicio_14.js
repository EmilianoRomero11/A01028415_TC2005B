function esPotenciaDeDos(numero) {
    numeroOriginal = numero
    while (numero%2 == 0){
        numero = numero/2
    }
    if (numero == 1){
        console.log(numeroOriginal + " es potencia de dos.")
    }
    else {
        console.log(numeroOriginal + " no es potencia de dos.")
    }
}
esPotenciaDeDos(8)  
esPotenciaDeDos(17)