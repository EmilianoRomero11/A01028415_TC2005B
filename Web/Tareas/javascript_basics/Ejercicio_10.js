function palindromo(string){
    let inicio = 0
    let final = string.length -1
    for (i = 0; i < string.length / 2; i++){
        if(string[inicio] !== string[final]){
            console.log("No es un palindromo")
            return
        }
        else{
            inicio++
            final--
        }
    }
    console.log(string+ " es un palindromo")
}

palindromo("anilina")