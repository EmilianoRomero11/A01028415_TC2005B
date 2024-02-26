function bubbleSort(arreglo){
    for(let i = 0; i < arreglo.length - 1; i++){
        for (let j = i+1; j < arreglo.length; j++){
            if (arreglo[i] > arreglo[j] ){
                let temp = arreglo[i]
                arreglo[i] = arreglo[j]
                arreglo[j] = temp
            }
        }
    }
}

arreglo = [3,1,7,6,2,6,4,8,0,9,6,1,3]
bubbleSort(arreglo)
console.log(arreglo)

