function factoriza(x){
    let factores = []
    for (i = x; i > 0; i--){
        if (x % i == 0){
            factores.push(i)
        }
    }
    return factores
}

let x = 12
let factores = factoriza(x)
console.log(factores)