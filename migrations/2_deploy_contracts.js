const ConvertLib = artifacts.require("ConvertLib");
// const MyLib = artifacts.require("MyLib");

const MetaCoin = artifacts.require("MetaCoin");
// const Koko = artifacts.require("Koko");
const WithdrawalContract = artifacts.require("WithdrawalContract");
const SendEther = artifacts.require("SendEther");

module.exports = function(deployer) {
  
  deployer.deploy(ConvertLib);
  // deployer.deploy(MyLib);
  
  deployer.link(ConvertLib, MetaCoin);
  // deployer.link(MyLib, Koko);

  deployer.deploy(MetaCoin);
  // deployer.deploy(Koko);
  deployer.deploy(WithdrawalContract);
  deployer.deploy(SendEther);

};
