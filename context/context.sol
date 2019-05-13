pragma solidity ^0.5.8;

contract Context
{
    address owner;
    string schainName = "SKALE";
    
    function getSchainName() public view returns (string memory)
    {
        return schainName;
    }
    function getSchainOwnerAddress() public view returns (address)
    {
        return owner;
    }
    function setSchainOwnerAddress(address newOwner) public
    {
        require(msg.sender == owner);
        owner = newOwner;
    }
}

