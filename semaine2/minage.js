fonction minage (block, cible) {

    return nonce
}


Hachage(block,nonce) {
    let concatenation = []
    concatenation = Buffer.concat ([blok,nonce])
    return crypto.createHash("sha256").update(concatenation,'utf8').digest("hex")
}

do {
    nonce = nonce+1
    chaineCandidate = chaine + nonce
    condensat = hachage(chaineCandidate)
}