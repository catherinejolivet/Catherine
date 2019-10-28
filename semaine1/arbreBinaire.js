// Ecrire la méthode qui permet d'ajouter un noeud dans un arbre binaire de recherche

ajouter (valeur) {
    if (this.gauche == undefined)
        this.gauche = new Noeud (valeur)
    else if (this.droite == undefined)
        this.droite = new Noeud (valeur)
    else
        this.gauche.ajouter (valeur)
}

ajouterNoeud (valeur) {
    if (this.racine !== undefined)
        this.racine.ajouter (valeur)
    else
        this.racine = new Noeud (valeur)
}
babolab = new Arbre ()
babolab.ajouterNoeud (6)
babolab.ajouterNoeud (3)
babolab.ajouterNoeud (7)
console.log("Baobab:", babolab)




// Définir la méthode pour trouver une valeur donnée dans un arbre binaire de recherche

// Ecrire la méthode pour afficher l'arbre selon un parcours infixe

