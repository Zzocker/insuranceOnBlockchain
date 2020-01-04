export FABRIC_CFG_PATH=$PWD

set -e

PROJECT=$(pwd)
echo $PROJECT
CLIPATH=$PROJECT/network/cli/peers
ORDERER=$CLIPATH/ordererOrganizations
PEER=$CLIPATH/peerOrganizations

rm -rf $CLIPATH

cryptogen generate --config=$PROJECT/crypto-config.yaml --output=$CLIPATH

rm -rf $PROJECT/network/orderer/crypto
rm -rf $PROJECT/network/policePeer/crypto
rm -rf $PROJECT/network/shopPeer/crypto
rm -rf $PROJECT/network/repairShopPeer/crypto
rm -rf $PROJECT/network/insurancePeer/crypto

mkdir $PROJECT/network/orderer/crypto
mkdir $PROJECT/network/policePeer/crypto
mkdir $PROJECT/network/shopPeer/crypto
mkdir $PROJECT/network/repairShopPeer/crypto
mkdir $PROJECT/network/insurancePeer/crypto

echo "Copying artifacts from cli to crypto"
cp -r $PEER/insurance-org/peers/insurance-peer/ $PROJECT/network/insurancePeer/crypto
cp -r $PEER/police-org/peers/police-peer/ $PROJECT/network/policePeer/crypto
cp -r $PEER/repairshop-org/peers/repairshop-peer/ $PROJECT/network/repairShopPeer/crypto
cp -r $ORDERER/orderer-org/orderers/orderer0/ $PROJECT/network/orderer/crypto
cp -r $PEER/shop-org/peers/shop-peer/ $PROJECT/network/shopPeer/crypto