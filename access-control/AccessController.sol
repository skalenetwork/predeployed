pragma solidity ^0.6.0;

contract AccessController {

    address owner;
    mapping(address => bool) private _whitelisted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Caller is not the owner");
        _;
    }

    function addAddress(address addr) external onlyOwner {
        _whitelisted[addr] = true;
    }

    function removeAddress(address addr) external onlyOwner {
        _whitelisted[addr] = false;
    }

    function isAddressWhitelisted(address addr) external view returns (bool) {
        return addr == owner || isContract(addr) || _whitelisted[addr];
    }

    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly { size := extcodesize(account) }
        return size > 0;
    }
}
