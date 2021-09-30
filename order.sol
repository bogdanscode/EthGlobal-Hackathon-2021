pragma solidity ^0.8.0;

import "./tracker1.sol";
//import "./cointracker2.sol";
import "./safemath.sol";
import "./interface.sol";
//import "./helpers/PredicateHelper.sol";
    contract orderss// is
   // PredicateHelper
    {
         using SafeMath for uint256;
        
  //  event Transfer(address indexed from, address indexed to, uint value);
//    event Approval(address indexed owner, address indexed spender, uint value);
        event makerAssetData(address sender, address receiver,uint amountMaker);
        event takerAssetData(address sender, address receiver,address signer, uint amount);
        
        
         IERC20 public token1;
    address public owner1;
    uint public amount1;
    IERC20 public token2;
    address public owner2;
    uint public amount2;

    constructor(
        address _token1,
        address _owner1,
        uint _amount1,
        address _token2,
        address _owner2,
        uint _amount2
    )public {
        token1 = IERC20(_token1);
        owner1 = _owner1;
        amount1 = _amount1;
        token2 = IERC20(_token2);
        owner2 = _owner2;
        amount2 = _amount2;
    }
        
        struct order{
            uint salt;
           address token1; //eth
           address token2; //eth into BUSD when target
             //transterfrom, signer,____,  amount
            // transferto, sender, signer, amount
            uint getMakerAmount;// 
            uint getTakerAmount;
            bytes predicate;
            bytes permit;
            bytes interaction;
        } //this struct will be used to track the nessicary info to buy and swap assets
        
      
        function fillorder(
            uint _salt,
            address _token1,
            address _token2,
            uint _getMakerAmount,
            uint _getTakerAmount,
            bytes memory _predicate,
            bytes memory _permit,
            bytes memory _interaction
            )public payable returns(bool, uint){
            //fill order struct
            success= true;
            error = false;
            _token1 = token1;
            _token2 = token2;
            getLatestPriceForToken1.call(token1);
            order memory neworder = order(
                _salt,
                _token1,
                _token2,
                _getMakerAmount, //find out about staticcal  
                _getTakerAmount, // check with staticcall
                _predicate, // GET THE .CALL predicate
                _permit,
                _interaction
                );
        
         return (token1price);
        return (token2price);
         emit makerAssetData(msg.sender, owner2, _getMakerAmount);
        emit takerAssetData( msg.sender, owner2, msg.sender, _getTakerAmount);
        return (true);
        }
        
            function checkPredicate(Order memory order) public view returns(bool) {
        bytes memory result = address(this).uncheckedFunctionStaticCall(order.predicate, "LOP: predicate call failed");
        require(result.length == 32, "LOP: invalid predicate return");
        
        return abi.decode(result, (bool));
            }
        //
    
  /*  function setAmountIndex(uint _AMOUNT_INDEX) public returns (uint) {
        
    }*/
        
        
        
        
        
  /*      function _callGetMakerAmount(order memory _order, uint takerAmount) internal view returns(uint makerAmount){
    if(order.getMakerAmount.length == 0 && takerAmount == order.TakerAssetData.decodeUint(_AMOUNT_INDEX)) {
        return order.makerAssetData.decodeUint(_AMOUNT_INDEX);
        
        
    }
    bytes memory result = address(this).uncheckedFunctionStaticCall(abi.encodePacked(order.getMakerAmount),"LOP: getMakerAmount call failed");
    require(result.length == 32, "LOP: invalid getMakerAmount ret");
    return abi.decide(resul, (uint));
    
}
        
        
        
      */  
        
        //this will let us know what price the progam will let us buy the token using dow theory's safe trading strategy
       
        
            function Buy(
               uint index
                ) public {
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
        
//function withdraw(amount)public payable returns (bool){
            
  //      }
        
        
        
        
        
    }
