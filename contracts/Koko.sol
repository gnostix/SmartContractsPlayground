//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <=0.7.6;

contract Koko {

    

    
    uint storedData;  // State variable
    event Paid(address indexed _from, uint _value);
    event Receive(address indexed _from, uint _value);
    event Fallback(address indexed _from, uint _value);

    constructor() payable {
        storedData = 1000;
    }
 // Function to receive Ether. msg.data must be empty
    receive() external payable {
        emit Receive(msg.sender, msg.value);
    }

    // Fallback function is called when msg.data is not empty
    fallback() external payable {
       emit Fallback(msg.sender, msg.value);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }


    function getKokoData() public pure returns(uint) {
        uint pipo = 100;

        return pipo * 100;
    }
}