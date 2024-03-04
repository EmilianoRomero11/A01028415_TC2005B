"use strict"

import express from 'express'

const app = express()

const port = 3000

app.get('/api/hello', (req, resp) =>{
    console.log("Hello from server")
    resp.status(200).send("Hello from server")
})

app.get('/api/hello/:name', (req, resp) =>{
    console.log(req.params)
    resp.status(200).send("Hello " + req.params.name)
})

app.listen(port, () =>{
    console.log('Listening on port ' + port)
})