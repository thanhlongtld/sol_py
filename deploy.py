import json
from solcx import compile_standard, install_solc
from web3 import Web3

install_solc("0.6.0")

with open("./SimpleStorage.sol", "r") as file:
    simple_storage_file = file.read()

complied_sol = compile_standard(
    {
        "language": "Solidity",
        "sources": {"SimpleStorage.sol": {"content": simple_storage_file}},
        "settings": {
            "outputSelection": {
                "*": {
                    "*": ["abi", "metadata", "evm.bytecode", "evm.bytecode.sourceMap"]
                }
            }
        },
    },
    solc_version="0.6.0",
)

with open("complied_sol.json", "w") as file:
    json.dump(complied_sol, file)

# get bytecode

bytecode = complied_sol["contracts"]["SimpleStorage.sol"]["SimpleStorage"]["evm"][
    "bytecode"
]["object"]

# get abi
abi = complied_sol["contracts"]["SimpleStorage.sol"]["SimpleStorage"]["abi"]

# connecting to ganache

w3 = Web3(Web3.HTTPProvider("HTTP://127.0.0.1:7545"))
chain_id = 5777
my_address = "0xcA56fB7a8E66E7292F04564d7B8621a3E2c263C3"
private_key = "0x26c0ad1cd0a8da29cea8853cc50b2d11828f491c6c235dc661607ba84b0cde58"

# Create a contract
SimpleStorage = w3.eth.contract(abi=abi, bytecode=bytecode)
vh 
68