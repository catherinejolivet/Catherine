// Exo 1.2.5. Explorer un arbre
// Méthode pour ajouter à gauche
class Noeud {
  constructor(valeur) {
    this.valeur = valeur
    this.gauche = undefined
    this.droit = undefined
  }
// Fonction ajouter = c'est une méthode
  ajouter(valeur) {
    if (this.gauche == undefined)
      this.gauche = new Noeud(valeur)
    else if (this.droite == undefined)
      this.droite = new Noeud(valeur)
    else 
      this.gauche.ajouter(valeur)
  }
}

ajouter(valeur)
if (valeur < this.valeur)
  if(this.gauche == new Noeud(valeur)
  else
  this.gauche.ajouter(valeur)
class Arbre {
  constructor() {
    this.racine = undefined....
  }

// Ajouter un noeud dans un arbre binaire de recherche
  ajouterNoeud (valeur) {
    if (this.racine !== undefined) 
      this.racine.ajouter(valeur)
    else 
      this.racine = new Noeud(valeur)
  }
}
// Trouver une valeur donnée dans un arbre binaire de 
trouverValeur (v) {
  if (this.racine !== valeur)
    return false 
    else res 
  else
    if (this.gauche.SousArbre !==valeur)
    return false
    else res
  else
    if (this droite.SousArbre !==valeur)
    return false
    else res
  else 

}


babobab = new Arbre()
babobab.ajouterNoeud(6)
babobab.ajouterNoeud(3)
babobab.ajouterNoeud(7)
console.log("Baobab:", babobab)
console.log("Affichage prefix:", babobab.afficherArbre())

