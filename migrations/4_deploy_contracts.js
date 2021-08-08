const Ballot = artifacts.require("Ballot");

module.exports = function(deployer) {
  deployer.deploy(Ballot,["0x70726f706f73616c31", "0x70726f706f73616c32","0x70726f706f73616c33"]);
};
