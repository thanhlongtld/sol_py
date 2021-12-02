// SPDX-License-Identifier: MIT

pragma solidity ^0.6.0;

contract SimpleStorage {
    // Some types in solidity
    // uint256 favoriteNumber = 5;
    // bool favoriteBool = true;
    // string favoriteString = "String";
    // int256 favoriteInt = -5;
    // address favoriteAddress = 0xE7cc4fBE27432bb99A2b3211db5fc21f83b54D46;
    // bytes32 favoriteBytes = "cat";

    // This will get initialized to 0
    uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }

    People public person = People({favoriteNumber: 2, name: "Long"});

    // Array
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;

    // public: can be accessed everywhere
    // internal: accesse by inside function only
    // external: aceesse by outside function only
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }

    // view: read some states (dont make transaction)
    // pure: purely do something of math
    // make tranasction: change something on the blockchain
    function retrieve() public view returns (uint256) {
        return favoriteNumber;
    }

    function pureTest() public pure {
        5 + 5;
    }

    // memory: only store during execution of function or contract call
    // storage: data will persist even after the function executes
    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People({name: _name, favoriteNumber: _favoriteNumber}));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
}
