pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;

contract reputation {

mapping (address => utilisateur) nomUtilisateur;

    struct Utilisateur {

// la ligne suivante déclare la variable reputation de type uint, c-à-d un entier position

        uint reputation;

// la ligne suivante représente une adresse sur le réseau Ethereum, en l'espèce celle de l'utilisateur inscrit.

        uint address;

        }

address [] utilisateur;

reputation[] utilisateur;

function Inscription() public {

  require(!Utilisateur[msg.sender], "Vous êtes déjà utilisateur !");

  if (nomUtilisateur[msg.sender]>0) {return;} else {

  nomUtilisateur[msg.sender] = Utisateur(1); 

  utilisateurs.push(msg.sender);

  }

function get() public view returns (uint) {

return reputation;

if {reputation < 1

}

function Desinscription() public {

  if (uint [msg.sender]<1) {

      revert();

  }

}