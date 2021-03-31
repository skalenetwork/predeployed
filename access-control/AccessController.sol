pragma solidity ^0.6.0;

contract AccessController {

    address owner;
    mapping(address => bool) private whitelisted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function addAddress(address addr) external {
        whitelisted[addr] = true;
    }

    function removeAddress(address addr) external {
        whitelisted[addr] = false;
    }

    function isAddressWhitelisted(address addr) external view returns (bool) {
        return whitelisted[addr] || addr == owner;
    }
}
