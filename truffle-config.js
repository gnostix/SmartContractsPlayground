
var HDWalletProvider = require("truffle-hdwallet-provider");

const INFURA_API_KEY = "59465ba9d0cd40eeae928a40b8a7f066";
const MNEMONIC = "soldier horse abuse trend reform pioneer history ladder wish hole list rude";

module.exports = {
  // Uncommenting the defaults below 
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  //


  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545,
      network_id: "*"
    },
    goerli: {
      provider: function () {
        return new HDWalletProvider(MNEMONIC, "https://goerli.infura.io/v3/59465ba9d0cd40eeae928a40b8a7f066")
      },
      network_id: 5,
      gas: 4000000      //make sure this gas allocation isn't over 4M, which is the max
    },
    ropsten: {
      provider: function () {
        return new HDWalletProvider(MNEMONIC, "https://ropsten.infura.io/59465ba9d0cd40eeae928a40b8a7f066")
      },
      network_id: 3,
      gas: 4000000      //make sure this gas allocation isn't over 4M, which is the max
    }
  },
  compilers: {
     solc: {
       version: "0.7.6"  // ex:  "0.4.20". (Default: Truffle's installed solc)
     }
  }
};
