pragma solidity 0.5.15;

/// @title Stockage horodaté et transmission successorale de "créations".
/// @author Catherine et Yosra.
/// @notice Vous pouvez utiliser ce contrat si vous êtes l'auteur d'écrits 
/// @notice (manuscrits, allocutions, journaux intimes...) que vous ne souhaitez pas publier pour le moment. 
/// @notice Vos documents seront enregistrés sur la blockchain Ethereum et auront alors 
/// @notice une date certaine. Vous désignerez un mandataire, et ainsi, à votre décès, 
/// @notice ils ne seront pas perdus, mais transmis à vos ayants droit ou à un légataire.
/// @dev Un seul contrat est déclaré, composé de ses fonctions.
contract DocTransmission{

// Une structure est créée déclarant un type complexe représentant un auteur. Elle sera utilisée
// pour ses variables tout au long du smart contract.
   struct Auteur{
       string nom;
       string prenom;
       string biographie;
       uint dateNaissance;
       uint dateDeces;
       address auteur;
       address heritier;
       mapping(address => bool) mandataires;
   }
  // Une deuxième structure est créée déclarant un type complexe représentant un document contenant 5 champs.
   struct Document{
       string titre;
       string typeContenu;
       uint date;
       address auteur; 
       bytes32 hash;
   }
    // Ceci déclare une variable d'état publique qui stocke un élément de structure "documents" 
    // pour chaque document.
   mapping(bytes32 => Document) documents;
   // Un tableau dynamique de structs "Document".
   Document[] listeDocuments;
    // Ceci déclare une variable d'état publique qui fait correspondre le hash d'un document
    // à l'adresse Ethereum du propriétaire du document.
   mapping(bytes32 => address) docOwner;
   // Ceci déclare une variable d'état publique qui stocke un élément de structure "auteurs" 
   // pour chaque auteur.
   mapping(address => Auteur) auteurs;
 
    // Modificateur qui sera utilisé pour modifier facilement le comportement de fonctions du smart contract :
    // ces fonctions ne pourront être appelées que par l'auteur du document.
   modifier onlyAuteur(){
       require(msg.sender == auteurs[msg.sender].auteur);
       _;
   }
    // Modificateur qui sera utilisé pour modifier facilement le comportement de fonctions du smart contract :
    // ces fonctions ne pourront être appelées que par un mandataire désigné par l'auteur.
   modifier onlyMandataire(address _auteur){
       require(auteurs[_auteur].mandataires[msg.sender]);
       _;
   }
    /// @notice Ajoute un document qui sera horodaté dans la blockchain Ethereum.
    /// @dev La fonction ajoutDoc va initialiser les structs et les ajouter dans les mappings.
    /// @param _titre Titre du document.
    /// @param _typeContenu Type de contenu du document (manuscrit, allocution, journal intime).
    /// @param _date Date à laquelle le document a été rédigé.
    /// @param _hash Hash du document.
    /// @param _nom Nom de l'auteur.
    /// @param _prenom Prénom de l'auteur.
    /// @param _biographie Biographie de l'auteur.
    /// @param _dateNaissance Date de naissance de l'auteur.
    /// @param _heritier Adresse Ethereum des héritiers (indivisaires ou légataire).
   function ajoutDoc(string memory _titre, string memory _typeContenu, uint _date, bytes32 _hash,
   string memory _nom, string memory _prenom, string memory _biographie, uint _dateNaissance, address _heritier) public{
       // Assigne une référence "nouveauDoc".
       Document memory nouveauDoc = Document(_titre, _typeContenu, _date, msg.sender, _hash);
       // Le hash du document est stocké pour chaque nouveau document.
       documents[_hash] = nouveauDoc;
       // Pour chacun des documents, un nouveau type d'élément Document est rajouté au tableau listeDocuments.
       listeDocuments.push(nouveauDoc);
        // Assigne une référence "nouveauAuteur"; la date de décès de l'auteur est renseignée à 0.
       Auteur memory nouveauAuteur = Auteur(_nom, _prenom, _biographie, _dateNaissance, 0, msg.sender, _heritier);
       // A chaque hash de document correspond l'adresse du msg.sender.
       docOwner[_hash] = msg.sender;
       // L'adresse du msg.sender est stockée pour chaque nouvel auteur.
       auteurs[msg.sender] = nouveauAuteur;
   }
    /// @notice Ajoute l'adresse Ethereum d'un mandataire (notaire, ayant droit ou toute personne de son choix).
    /// @notice Seul l'auteur est habilité à désigner le mandataire.
    /// @dev La fonction ajoutMandataire va ajouter une variable au struct Auteur.
    /// @param _mandataire Si vraie, l'adresse Ethereum d'un mandataire est renseignée.
   function ajoutMandataire(address _mandataire) onlyAuteur public{
       Auteur storage auteur = auteurs[msg.sender];
       auteur.mandataires[_mandataire] = true;
   }
    /// @notice Ajoute l'adresse Ethereum des héritiers d'un auteur.
    /// @notice Celui qui ajoute les héritiers est soit l'auteur, soit un mandataire désigné par lui.
    /// @dev La fonction ajoutHeritier va ajouter l'adresse Ethereum des héritiers (indivisaires ou légataire).
    /// @param _heritier Adresse Ethereum des héritiers (indivisaires ou légataire).
    /// @param _auteur Adresse Ethereum de l'auteur.
   function ajoutHeritier(address _heritier, address _auteur) public{
       require(msg.sender == auteurs[msg.sender].auteur || auteurs[_auteur].mandataires[msg.sender]);
       Auteur storage auteur = auteurs[msg.sender];
       auteur.heritier = _heritier;
   }
    /// @notice Déclare une date de décès qui est conservée de façon persistante dans la base de donnée.
    /// @notice Seul le mandataire désigné par l'auteur peut exécuter cette action.
    /// @dev La fontion declarerDeces va ajouter la date de décès et permettre le transfert de propriété du document 
    /// @dev après qu'une structure de contrôle soit mise en place.
    /// @param _auteur Adresse Ethereum de l'auteur.
    /// @param _dateDeces Date de décès de l'auteur.
    /// @param _hash Hash du document.
   function declarerDeces(address _auteur, uint _dateDeces, bytes32 _hash) onlyMandataire(_auteur) public{
       Auteur storage auteur = auteurs[msg.sender];
       auteur.dateDeces = _dateDeces;
       if(auteurs[_auteur].heritier != address(0)){
           transfertOwnership(_hash, _auteur);
       }
   }
    /// @notice Transfère la propriété du document aux héritiers.
    /// @notice Seul le mandataire désigné par l'auteur peut exécuter cette action,
    /// @notice dès lors que la date de décès est renseignée et les héritiers désignés.
    /// @dev La fonction transfertOwnership exécute le transfert de propriété du document.
    /// @param _hash Hash du document.
    /// @param _auteur Adresse Ethereum de l'auteur.
   function transfertOwnership(bytes32 _hash, address _auteur) onlyMandataire(_auteur) public{
       require(auteurs[_auteur].heritier != address(0));
       require(auteurs[_auteur].dateDeces > 0);
       docOwner[_hash] = auteurs[_auteur].heritier;
   }
}