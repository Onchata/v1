// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IOnchataCore {
    function requestData(
        uint256 _oracleId,
        address _callbackAddress,
        bytes4 _callbackFunctionSignature
    ) external returns (uint256);
}

abstract contract OnchataConsumer {
    IOnchataCore public OnchataCore;

    constructor(address _OnchataCore) {
        OnchataCore = IOnchataCore(_OnchataCore);
    }

    // Modifier to restrict access to only the OnchataCore contract
    modifier onlyOnchata() {
        require(msg.sender == address(OnchataCore), "Caller is not Onchata");
        _;
    }
}
