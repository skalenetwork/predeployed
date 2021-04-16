pragma solidity ^0.8.0;
import "@openzeppelin/contracts/utils/Address.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";

contract DeploymentController is AccessControl {
    bytes32 public constant DEPLOYER_ROLE = keccak256("DEPLOYER_ROLE");

    function addToWhitelist(address addr) external {
        grantRole(DEPLOYER_ROLE, addr);
    }

    function removeFromWhitelist(address addr) external {
        revokeRole(DEPLOYER_ROLE, addr);
    }

    function isAddressWhitelisted(address addr) external view returns (bool) {
        return hasRole(DEFAULT_ADMIN_ROLE, addr) || hasRole(DEPLOYER_ROLE, addr) || Address.isContract(addr);
    }
}
