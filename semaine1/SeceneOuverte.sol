pragma solidity ^0.5.11;

contract SceneOuverte {
    // 0x9ce49D5A5a7f7Df97672eAa1A2AA4A0b2Ef6Ac2D
    string[12] passagesArtistes;
    uint creneauxLibres = 12;
    uint tour;
  
function sInscrire(string memory nomDArtistes) public {
    if(creneauxLibres>0){
        passagesArtistes[12-creneauxLibres] = nomDArtistes;
        creneauxLibres -= 1; //creneauxLibres = creneauxLibres - 1
    }
}

function passerArtisteSuivant() public {
    tour += 1;
}

function getTour() public view returns (uint) {
    return tour;
}

function artisteEnCours() public view returns (string memory) {
    //passagesArtistes [tour]
    return passagesArtistes[tour];
}

}


