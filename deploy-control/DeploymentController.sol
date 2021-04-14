pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract DeploymentController is Ownable {

    mapping(address => bool) private _whitelisted;

    function addAddress(address addr) external onlyOwner {
        _whitelisted[addr] = true;
    }

    function removeAddress(address addr) external onlyOwner {
        _whitelisted[addr] = false;
    }

    function isAddressWhitelisted(address addr) external view returns (bool) {
        return addr == owner() || Address.isContract(addr) || _whitelisted[addr];
    }
}
