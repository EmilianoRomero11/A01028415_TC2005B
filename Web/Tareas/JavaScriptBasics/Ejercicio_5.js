function mcd(x, y) {
    let a = false;
    let b = Math.min(x, y); 
    let mcd = 1; 
    while (b > 0) {
        if (x % b === 0 && y % b === 0) {
            mcd = b; 
            break; 
        }
        b--;
    }
    console.log("Maximo comun divisor: " + mcd);
}

mcd(18, 24); 
