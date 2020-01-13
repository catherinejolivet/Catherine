//import module 'https'
const https = require('https')
//adresse de l'API du site bitmex
const url = 'https://www.bitmex.com/api/v1/orderBook/L2?symbol=XBT&depth=5'

let request = https.get(url, function(response){
    let buffer = ''
    let data = []
    response.on("data", function(chunk){
        buffer += chunk
    })
    response.on("end", function(err){
        data = JSON.parse(buffer)
        console.log(data)
    })
})