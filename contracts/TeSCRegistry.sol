/** SPDX-License-Identifier: MIT */
pragma solidity ^0.7.5;

interface TeSCRegistry {
    // @notice enum that defines the two event types
    enum EventType {Add, Remove}

    // @dev This emits after an entry was added to or removed from the registry
    event RegistryChanged(string domain, address indexed contractAddr, EventType eventType);

    // @notice Adds a new entry to the registry
    // @dev Deploy endorsed contract and set its values before adding it to the registry
    // @param _contractAddr The address of the endorsed contract
    function add(address _contractAddr) external;


    // @notice Returns the addresses of all contracts that are stored for the given domain hash
    // @dev The parameter must be equal to the domain hash that was given when the entries were added
    // @param _domain The domain hash for which the contract addresses will be returned
    // @return An array of all contract addresses stored for the given domain hash
    function getContractsFromDomain(string calldata _domain) external view returns (address[] memory);

    // @notice Returns whether the given contract is stored in the registry
    // @param _contractAddr The address of the contract to be checked
    // @return True if the given contract is stored in the registry
    function isContractRegistered(address _contractAddr) external view returns (bool);
}
