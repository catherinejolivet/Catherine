const readline = require("readline")
const rli = readline.createInterface({
    inpout : process.stdin,
    output : process.stdout
})
rli.on("line", (userinpout => solution))
