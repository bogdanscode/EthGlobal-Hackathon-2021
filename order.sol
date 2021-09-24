pragma solidity 0.8.0;

import "https://github.com/smartcontractkit/chainlink/blob/master/evm-contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "./SafeMath.sol";
    contract orders{
         using Safemath for uint256;
        
         IERC20 public makerAsset;
    address public owner1;
    uint public amount1;
    IERC20 public takerAsset;
    address public owner2;
    uint public amount2;

    constructor(
        address makerAsset,
        address _owner1,
        uint _amount1,
        address takerAsset,
        address _owner2,
        uint _amount2
    ) {
        makerAsset = IERC20(makerAsset);
        owner1 = _owner1;
        amount1 = _amount1;
        takerAsset = IERC20(takerAsset);
        owner2 = _owner2;
        amount2 = _amount2;
    }
        
        struct order{
            uint salt;
            address makerAsset; //eth
            address takerAsset; //eth into BUSD when target buy is hit in javascript loop
            bytes makerAssetData; //transterfrom, signer,____,  amount
            bytes takerAssetData;// transferto, sender, signer, amount
            bytes getMakerAmount;// 
            bytes getTakerAmount;
            bytes predicate;
            bytes permit;
            bytes interaction;
            
            order[] orders;
            
        }
        //this struct will be used to track the nessicary info to buy and swap assets
        function fillorder(
            uint salt,
            address makerAsset,
            address takerAsset,
            bytes memory makerAssetData,
            bytes memory takerAssetData,
            bytes memory getMakerAmount,
            bytes memory getTakerAmount,
            bytes memory predicate,
            bytes memory permit,
            bytes memory interaction
            )public payable returns(bool){
            //fill order struct
            order memory neworder = orders[];
            orders.push = neworder;
            
        }
        
        //this will let us know what price the progam will let us buy the token using dow theory's safe trading strategy
        function getMakerAmountset()public returns(uint){
            //swaap the coin for taker amount                           
        }
        
            function limitOrderSwap() public {
        require(msg.sender == owner1 || msg.sender == owner2, "Not authorized");
        require(
            token1.allowance(owner1, address(this)) >= amount1,
            "Token 1 allowance too low"
        );
        require(
            token2.allowance(owner2, address(this)) >= amount2,
            "Token 2 allowance too low"
        );

        _safeTransferFrom(token1, owner1, owner2, amount1);
        _safeTransferFrom(token2, owner2, owner1, amount2);
    }

    function _safeTransferFrom(
        IERC20 token,
        address sender,
        address recipient,
        uint amount
    ) private {
        bool sent = token.transferFrom(sender, recipient, amount);
        require(sent, "Token transfer failed");
    }
        
         function withdraw(amount)public payable returns (bool){
            
        }
        
        
        
        
        
    }
