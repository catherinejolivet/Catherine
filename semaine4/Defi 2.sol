pragma solidity ^0.5.11;
pragma experimental ABIEncoderV2;
contract reputation {
mapping (address => utilisateur) nomUtilisateur;
    struct Utilisateur {
        uint reputation;
        }
address [] utilisateur;

function Inscription() public {
  require(!Utilisateur[msg.sender], "Vous êtes déjà utilisateur !");
  if (nomUtilisateur[msg.sender]>0) {return;} else {
  nomUtilisateur[msg.sender] = Utisateur(1); 
  utilisateurs.push(msg.sender);
  }
}
function Desinscription() public {
  if (uint [msg.sender]<1) {
      revert();
  }
}