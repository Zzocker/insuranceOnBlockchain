PROJPATH=$(pwd)/network
PEERS=$PROJPATH/cli/peers/peerOrganizations

WEBCERTS=$(pwd)/web/certs
rm -rf $WEBCERTS
mkdir -p $WEBCERTS
cp $PROJPATH/orderer/crypto/tls/ca.crt $WEBCERTS/ordererOrg.pem
cp $PROJPATH/insurancePeer/crypto/tls/ca.crt $WEBCERTS/insuranceOrg.pem
cp $PROJPATH/policePeer/crypto/tls/ca.crt $WEBCERTS/policeOrg.pem
cp $PROJPATH/repairShopPeer/crypto/tls/ca.crt $WEBCERTS/repairShopOrg.pem
cp $PROJPATH/shopPeer/crypto/tls/ca.crt $WEBCERTS/shopOrg.pem
cp $PEERS/insurance-org/users/Admin@insurance-org/msp/keystore/* $WEBCERTS/Admin@insurance-org-key.pem
cp $PEERS/insurance-org/users/Admin@insurance-org/msp/signcerts/* $WEBCERTS/
cp $PEERS/shop-org/users/Admin@shop-org/msp/keystore/* $WEBCERTS/Admin@shop-org-key.pem
cp $PEERS/shop-org/users/Admin@shop-org/msp/signcerts/* $WEBCERTS/
cp $PEERS/police-org/users/Admin@police-org/msp/keystore/* $WEBCERTS/Admin@police-org-key.pem
cp $PEERS/police-org/users/Admin@police-org/msp/signcerts/* $WEBCERTS/
cp $PEERS/repairshop-org/users/Admin@repairshop-org/msp/keystore/* $WEBCERTS/Admin@repairshop-org-key.pem
cp $PEERS/repairshop-org/users/Admin@repairshop-org/msp/signcerts/* $WEBCERTS/