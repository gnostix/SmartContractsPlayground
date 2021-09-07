const WithdrawalContract = artifacts.require("WithdrawalContract");

module.exports = function(deployer) {
  // deployer.deploy(Ballot,["0x4e616d653100000000000000000000", "0x4e616d653200000000000000000000"]);
  deployer.deploy(WithdrawalContract);
};
