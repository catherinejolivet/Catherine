# DocTransmission
_Vous pouvez utiliser ce contrat si vous êtes l'auteur d'écrits (manuscrits, allocutions, journaux intimes...) que vous ne souhaitez pas publier pour le moment. Vos documents seront enregistrés sur la blockchain Ethereum et auront alors une date certaine. Vous désignerez un mandataire, et ainsi, à votre décès, ils ne seront pas perdus, mais transmis à vos ayants droit ou à un légataire._
> Created By Catherine et Yosra.

Un seul contrat est déclaré, composé de ses fonctions.
## Stockage horodaté et transmission successorale de "créations".

## ajoutDoc - read
|name |type |description
|-----|-----|-----------
|_titre|string|Titre du document.
|_typeContenu|string|Type de contenu du document (manuscrit, allocution, journal intime).
|_date|uint256|Date à laquelle le document a été rédigé.
|_hash|bytes32|Hash du document.
|_nom|string|Nom de l'auteur.
|_prenom|string|Prénom de l'auteur.
|_biographie|string|Biographie de l'auteur.
|_dateNaissance|uint256|Date de naissance de l'auteur.
|_heritier|address|Adresse Ethereum des héritiers (indivisaires ou légataire).
La fonction ajoutDoc va initialiser les structs et les ajouter dans les mappings.

## ajoutHeritier - read
|name |type |description
|-----|-----|-----------
|_heritier|address|Adresse Ethereum des héritiers (indivisaires ou légataire).
|_auteur|address|Adresse Ethereum de l'auteur.
La fonction ajoutHeritier va ajouter l'adresse Ethereum des héritiers (indivisaires ou légataire).

## ajoutMandataire - read
|name |type |description
|-----|-----|-----------
|_mandataire|address|Si vraie, l'adresse Ethereum d'un mandataire est renseignée.
La fonction ajoutMandataire va ajouter une variable au struct Auteur.

## declarerDeces - read
|name |type |description
|-----|-----|-----------
|_auteur|address|Adresse Ethereum de l'auteur.
|_dateDeces|uint256|Date de décès de l'auteur.
|_hash|bytes32|Hash du document.
La fontion declarerDeces va ajouter la date de décès et permettre le transfert de propriété du document après qu'une structure de contrôle soit mise en place.

## transfertOwnership - read
|name |type |description
|-----|-----|-----------
|_hash|bytes32|Hash du document.
|_auteur|address|Adresse Ethereum de l'auteur.
La fonction transfertOwnership exécute le transfert de propriété du document.