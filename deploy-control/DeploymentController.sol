pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract DeploymentController is AccessControl {
    bytes32 public constant DEPLOYER = keccak256("DEPLOYER");

    function addAddress(address addr) external {
        grantRole(DEPLOYER, addr);
    }

    function removeAddress(address addr) external {
        revokeRole(DEPLOYER, addr);
    }

    function isAddressWhitelisted(address addr) external view returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, addr) || Address.isContract(addr) || hasRole(DEPLOYER, addr);
    }
}
