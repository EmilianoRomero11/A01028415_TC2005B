function mayusculas(string){
    let palabra = string.split(" ");

    for(let i=0; i<palabra.length; i++) {
      palabra[i]=palabra[i].charAt(0).toUpperCase()+palabra[i].slice(1);
    }
    let resultado=palabra.join(" ");
    return resultado;
  }
  let string="hola mundo";
  let resultado=mayusculas(string);
  console.log(resultado);