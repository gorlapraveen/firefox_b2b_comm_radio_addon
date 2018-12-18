#!/bin/bash
#below follows the order of the process
# encrypt text/file using gpg(generates .gpg/cipher file) >encode base64 (generate encoded text)> send using rf_tx > receieve at rf_rx >decode base64 > decrypt gpg file

#ingenral `gpg command gpg --pinentry-mode loopback --passphrase 88bottlesOfBeer --symmetric myfile`
bash -c "gpg --pinentry-mode loopback --passphrase $2 -c $1"
encode=$(bash -c "base64 New.txt.gpg") 
echo $encode

##rx_tx.py encode

