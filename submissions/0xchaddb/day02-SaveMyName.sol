// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract SaveMyName {
    struct Profile {
        string name;
        string bio;
    }

    mapping(address => Profile) private profiles;

    /// @notice Save your name and bio
    function saveProfile(string calldata name, string calldata bio) external {
        profiles[msg.sender] = Profile(name, bio);
    }

    /// @notice Get the profile of any address
    function getProfile(address user) external view returns (string memory, string memory) {
        Profile storage profile = profiles[user];
        return (profile.name, profile.bio);
    }
}