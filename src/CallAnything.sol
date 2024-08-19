//SPDX-License-Identifier:MIT

pragma solidity ^0.8.18;

contract CallAnything {
    /*In order to call function using only data fields and call, we need to encode:
    1) the function name
    2) The parameters we want to add
    3) Down to binary level
    */
    /* 
    Now each function interact to each contract have funciton ID. This is known as function selector
    - The function selector is the first 4 bytes of the function signature
    - the function signature is the string that define funciton name & parameters
    */

    address public s_someAddress;
    uint256 public s_amount;

    function transfer(address someAddress, uint256 amount) public {
        s_someAddress = someAddress;
        s_amount = amount;
    }

    function getSelectorOne() public pure returns (bytes4 selector) {
        selector = bytes4(keccak256(bytes("transfer(address,uint256)")));
        return selector;
    }

    function getDataToCallFunction(address someAddress, uint256 amount) public pure returns (bytes memory) {
        return abi.encodeWithSelector(getSelectorOne(), someAddress, amount);
    }

    function getDataToCallFunctionWithSignature(address someAddress, uint256 amount)
        public
        pure
        returns (bytes memory)
    {
        return abi.encodeWithSignature("transfer(address,uint256)", someAddress, amount);
    }
    // 0xa9059cbb

    function callTransferFunctionDirectly(address someAddress, uint256 amount) public returns (bytes4, bool) {
        (bool success, bytes memory returnData) =
            address(this).call(getDataToCallFunctionWithSignature(someAddress, amount));
        return (bytes4(returnData), success);
    }
}
