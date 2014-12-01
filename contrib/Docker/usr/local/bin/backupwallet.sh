#!/bin/bash
WALLETDIR=/home/wallets
MAZADIR=/home/maza/.mazacoin

## First, see if we have a container marker on ${WALLETDIR}
if [ -f ${WALLETDIR}/.container ] ; then 
   wc=1
   cd ${WALLETDIR}
else cd ${MAZADIR} 
   wc=0
fi
/usr/local/bin/mazacoin-cli backupwallet wallet.BAK.`date +%Y-%m-%d.%H%M`

