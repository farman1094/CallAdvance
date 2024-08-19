// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Encoding {
    function encodeStrings() public pure returns (bytes memory) {
        bytes memory encoded = abi.encode("some string");
        return encoded;
    }

    function decodeStrings() public pure returns (string memory) {
        string memory str = abi.decode(encodeStrings(), (string));
        return str;
    }

    function typeCasting(string memory str) public pure returns (bytes memory) {
        bytes memory typeCasted = bytes(str);
        return typeCasted;
    }

    function combineStringsEncode() public pure returns (string memory) {
        return string(abi.encodePacked("Hi bro ", "sup?"));
    }

    function convertTObinary(uint256 number) public pure returns (bytes memory) {
        bytes memory number1 = abi.encode(number);
        return number1;
    }

    function encodeExample() public pure returns (bytes memory, bytes memory) {
        return (
            abi.encode("learning"), // Encoded with padding
            abi.encodePacked("learning") // Tightly packed encoding
        );
    }

    function multiEncode() public pure returns (bytes memory) {
        bytes memory multi = abi.encode("farman ", 123);
        return multi;
    }

    function multiDecode() public pure returns (string memory, uint256) {
        (string memory someString, uint256 someOther) = abi.decode(multiEncode(), (string, uint256));
        return (someString, someOther);
    }

    function multiEncodePacked() public pure returns (bytes memory) {
        bytes memory multi = abi.encodePacked("farman ", "leaning web3");
        return multi;
    }

    function multiStringCastPacked() public pure returns (string memory) {
        string memory someString = string(multiEncodePacked());
        return someString;
    }
}
