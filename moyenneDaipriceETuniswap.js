import "daiprice.js"
import "uniswap.js"
const web3 = require("web3")
const provider = "mainnet.infura.io/v3/5053248222244adbb6dd4ef274a3b67c"
const w3 = new web3()
w3.setProvider(provider)





const daiPrice = require("./daiprice.js")
const uniswapPrice = require("./uniswapEthPrice.js")


async function getAverage () {
    let value1 = await daiPrice.ReadMedianizer()
    console.log(value1)
    let value2 = await uniswapPrice.priceInWei()
    console.log(value2)
    let average = (value1 + value2) / 2
    return average
}

getAverage().then((result) => {
    console.log(result)
})



function getvalue () {

}

afficher oldPrice1 = function ()
afficher oldPrice2 = function ()
