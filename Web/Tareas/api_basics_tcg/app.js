"use strict"

import express from 'express'

const app = express()

const port = 3000

app.use(express.json())

var cards = [
    {id : 1, nombre : "ataque"},
    {id : 2, nombre : "ataque2"},
    {id : 3, nombre : "ataque3"},
    {id : 4, nombre : "defensa"},
    {id : 5, nombre : "defensa2"},
    {id : 6, nombre : "defensa"},
]


app.get('/api/allcards', (req, resp) =>{
    console.log("Showing all cards")
    for (let i = 0; i < cards.length; i++){
        console.log("id: "+ cards[i].id +" nombre: "+ cards[i].nombre)
    }
    resp.status(200).send("OK")
})

app.get('/api/getcard/:id', (req, resp) =>{
    console.log("Searching for card with id: "+req.params.id)
    let check_id = false
    let index = 0
    for (let i = 0; i < cards.length; i++){
        if (cards[i].id == req.params.id){
        check_id = true
        index = i
    }}
    if (check_id == false){
        resp.status(400).send("No card found with id "+req.params.id)
    }
    else{
        console.log("Card with index "+req.params.id + " is: "+cards[index].nombre)
        resp.status(200).send("Hello " + req.params.name)
    }

})


app.post('/api/addcard', (req, resp) => {
    let nuevaCarta = req.body
    let check_id = false
    let index = 0
    for (let i = 0; i < cards.length; i++){
        if (cards[i].id == req.params.id){
        check_id = true
        index = i
    }}
    if (Object.keys(nuevaCarta).length != Object.keys(cards[0]).length){
        resp.status(400).send("La carta no cuenta con los atributos correctos para agregarla")
    }
    if (check_id == true){
        resp.status(400).send("La carta ya existe")
    }
    else{
        cards.push(nuevaCarta)
        resp.status(201).send("Carta agregada correctamente")
    }
})

app.delete('/api/deletecard/:id', (req, resp) => {
    let index = 0;
    let check_id = false;
    for (let i = 0; i < cards.length; i++){
        if (cards[i].id == req.params.id){
        check_id = true
        index = i
    }}
    if (check_id == true) {
        cards.splice(index, 1)
        resp.status(200).send("Carta borrada correctamente")
    } 
    else {
        resp.status(404).send("Carta no encontrada")
    }
});

app.patch('/api/updatecard/:id', (req, resp) => {
    let update = req.body;
    let index = 0;
    let check_id = false;
    for (let i = 0; i < cards.length; i++){
        if (cards[i].id == req.params.id){
        check_id = true
        index = i
    }}
    if (check_id == true){
        let card = cards[index]
        Object.keys(update).forEach(key => card[key] = update[key]);
        resp.status(200).send({ message: "Carta actualizada correctamente" });

        resp.status(200).send("Carta actualizada correctamente")
    }
    else {
        resp.status(400).send("Carta no encontrada")
    }
})


app.listen(port, () =>{
    console.log('Listening on port ' + port)
})

