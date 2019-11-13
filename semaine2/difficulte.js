function cibleToDifficulty(currentCible) {
let difficulty
var maxCible = 2.7 * Math.pow(10,67)
difficulty = maxCible/currentCible
return difficulty
}
    console.log(cibleToDifficulty(1))
    console.log(cibleToDifficulty(10))