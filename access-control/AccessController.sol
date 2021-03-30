pragma solidity ^0.6.0;

contract AccessController {

    address owner;
    mapping(address => bool) whitelisted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function addAddress(address addr) external onlyOwner {
        whitelisted[addr] = true;
    }

    function removeAddress(address addr) external onlyOwner {
        whitelisted[addr] = false;
    }
}
