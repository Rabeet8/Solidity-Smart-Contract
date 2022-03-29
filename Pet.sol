// SPDX License Idenifier: MIT
pragma solidity ^0.8.7;

contract PetShop{
    address[20] public adopters;

    modifiers isOwner(uint256  petId){
        require (adopters[petId] == msg.sender, "Error only pet adopter can remove adoption");
    }
function adoptPet(uint256 petId) public returns (uint256)
require(adopters[petId] == address(0), "This pet isAlready aAdopted");
adopters[petId] = msg.sender;
return petId;
}

function getAdopters() public view returns (address[20] memory){
    return adopters;
}

function getAdopter(uint256 petId) public view returns (address){
    return adopters[petId];
}
function removeAdoption (uint256 petId) public isOwner (petId) returns (bool){
    adopters[petId] = address(0);
    return true;
}