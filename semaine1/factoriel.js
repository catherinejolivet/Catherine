//Implémentation itérative de la fonction factorielle (et non récursive)

function factoriel(n) {
    if(n===0) {
        return 1
    }
    else {
        res = 1;
        for (i = 2; i <= n; i++)
        res *= i
    }
    return res
}
nombre = 2
console.log(nombre,"!", factoriel(nombre))

