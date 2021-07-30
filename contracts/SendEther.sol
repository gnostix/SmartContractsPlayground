//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.6.0 <=0.7.6;

contract SendEther {

    uint storedData;  // State variable

    constructor() payable {
        storedData = 2222;
    }

    event TheData(bytes myData);

    function sendViaCall(address payable _to) public payable {
        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        emit TheData(data);

        require(sent, "Failed to send Ether");
    }

}
