#!/bin/bash
#below follows the order of the process
# encrypt text/file using gpg(generates .gpg/cipher file) >encode base64 (generate encoded text)> send using rf_tx > receieve at rf_rx >decode base64 > decrypt gpg file

#commandline format ./main.sh send filename(if text input is given convert it to file) passphrase
#ingenral `gpg command gpg --pinentry-mode loopback --passphrase 88bottlesOfBeer --symmetric myfile`
bash -c "gpg --pinentry-mode loopback --passphrase $3 -c $2"
encode=$(bash -c "base64 New.txt.gpg") 
echo $encode >>encode.txt

##rx_tx.py encode
if [[ $1 == send ]]; then
 ./pluto_msg_tx.py

