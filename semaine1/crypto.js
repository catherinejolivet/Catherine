// Fonction qui fait un condensat de condensat
function doubleHachage (entrée) {
    hash = buffer.from(entrée)
    crypto.createHash("sha256").update(entreeBuffer).digest()
    doubleHash = crypto.createHash("sha256").update(hash).digest()
    return doubleHash
}

// Fonction qui donne la chaine dont le hash commence par "66"

