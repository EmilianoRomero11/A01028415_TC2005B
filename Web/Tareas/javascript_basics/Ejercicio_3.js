function reverse(arreglo){
    let j = arreglo.length -1
    for(let i = 0; i<arreglo.length/2; i++){
        let temp = arreglo[i]
        arreglo[i] = arreglo[j]
        arreglo[j] = temp
        j--
    }
}

arreglo = [1,2,3,4,5]
reverse(arreglo)
for(let i = 0; i < arreglo.length; i++){
    console.log(arreglo[i])
}
