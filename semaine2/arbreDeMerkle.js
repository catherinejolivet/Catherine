const crypto = require("crypto")
class ArbreDeMerkle {
    constructor(feuilles){
        this.feuilles = feuilles
        this.arbre=[[]]

    }

}

for(let f of feuilles){
    this.arbre[0].push(this.hachageChaine(f))

}

hachageChaine(chaine){
    return crypto.createHash("sha256").update(Buffer.from(chaine), 'UTF8').digest()
}

afficher(){
    console.log(this.feuilles)
    console.log(this.arbre)
}
erable : new ArbreDeMerkle(["AA","BB","CC","DD"])
erable.afficher()
erable.hachage(Buffer.From("aa"))

