const bitcoin = require('bitcoinjs-lib')
const { alice, bob, carol, dave } = require('./wallets.json')
const network = bitcoin.networks.regtest

// Participants
const keyPairAlice1 = bitcoin.ECPair.fromWIF(alice[1].wif, network)
const keyPairBob1 = bitcoin.ECPair.fromWIF(bob[1].wif, network)
const keyPairCarol1 = bitcoin.ECPair.fromWIF(carol[1].wif, network)
const keyPairDave1 = bitcoin.ECPair.fromWIF(dave[1].wif, network)

// Recipient
const keyPairAlice2 = bitcoin.ECPair.fromWIF(alice[2].wif, network)
const p2wpkhAlice2 = bitcoin.payments.p2wpkh({pubkey: keyPairAlice1.publicKey, network})

// Build transaction
const p2ms = bitcoin.payments.p2ms({
  m: 2, pubkeys: [
    keyPairAlice1.publicKey,
    keyPairBob1.publicKey,
    keyPairCarol1.publicKey,
    keyPairDave1.publicKey], network})

console.log('redeemScript  ', p2ms.output.toString('hex'))

const p2sh = bitcoin.payments.p2sh({redeem: p2ms, network})

const txb = new bitcoin.TransactionBuilder(network)

txb.addInput('5eb8743b4a8f3294189636b56d23cd10b635bbf7d11067cf2258e3370fbdf8a8',0)
txb.addOutput(p2wpkhAlice2.address, 999e5)


// Signing
// txb.sign(index, keyPair, redeemScript, sign.hashType, value, witnessScript)
txb.sign(0, keyPairAlice1, p2sh.redeem.output)
txb.sign(0, keyPairBob1, p2sh.redeem.output)

const tx = txb.build()
console.log('tx.toHex()  ', tx.toHex())