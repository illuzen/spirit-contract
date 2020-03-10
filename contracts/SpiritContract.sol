pragma solidity ^0.5.0;

contract SpiritContract {

    mapping (address => Permissions) public accounts;

    struct Permissions {
        mapping (bytes32 => bool) permissions;
    }

    event OfferingReceived(address receiver, bytes32 description);
    event PermissionSet(address setter, bytes32 permission, bool granted);


    constructor() {

    }

    function setPermission(bytes32 permission, bool granted) public {
        accounts[msg.sender].permissions[permission] = granted;
    }

    function offeringReceived(bytes32 description) public {
        emit OfferingReceived(msg.sender, description);
    }
}
