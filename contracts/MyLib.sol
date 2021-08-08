// SPDX-License-Identifier: MIT
pragma solidity >=0.4.25 <=0.7.6;


library MyLib{

	function convertMe(uint amount,uint conversionRate) public pure returns (uint convertedAmount)
	{
		return amount * conversionRate;
	}

}
