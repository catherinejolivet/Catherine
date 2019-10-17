function hachage(chaine) {
    condensat=0
    for (let i = 0; i < chaine.lenght; i++) {
        condensat += chaine.charCodeAt(i) * 100** (i+1)
    }
return condensat % 653 

}