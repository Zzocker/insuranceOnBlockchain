const FabricCAServices = require('fabric-ca-client')
const {FileSystemWallet, X509WalletMixin} = require('fabric-network')
const fs = require('fs')
const path = require('path')

const configPath = path.join(process.cwd(),'./config.json')
const configJSON = fs.readFileSync(configPath,'utf8')
const config = JSON.parse(configJSON)

const appAdmin = config.appAdmin
const appAdminSecret = config.appAdminSecret
const orgMSPID = config.orgMSPID
const caName = config.caName

async function main(){
    try {
        const caURL = caName
        const ca = new FabricCAServices(caURL)

        const walletPath = path.join(process.cwd(),'./wallet')
        const wallet = new FileSystemWallet(walletPath)

        const adminExists = await wallet.exists(appAdmin)
        if (adminExists){
            console.log("An identity for the admin user already exists in the wallet")
            return
        }

        const enrollment = await ca.enroll({enrollmentID:appAdmin,enrollmentSecret: appAdminSecret})
        const identity = X509WalletMixin.createIdentity(orgMSPID,enrollment.certificate,enrollment.key.toBytes())
        wallet.import(appAdmin,identity)
    } catch (error) {
        console.error(`Failed to enroll admin user ' + ${appAdmin} + : ${error}`);
        process.exit(1);
    }
}
main()
