pragma solidity ^0.8.0;
/*
dow theory calculator
required variables:
-mean price     use the data of the last 30 days open candels a+a+a+a+a+...etc a*30 =b, b/30 = average price
-the target buy price   target buy price will be  ex.
min1 + min2 + min3 = x/3= target

-the target sell price
max1 + max2 + max3 = y/3 = target


-min and max extravagant tester to make sure the min and max are not un-reapeatable
min - 2nd lowest min != < 5% difference
max - 2nd highest max != <5% difference 

options after sell price is hit:
look at other stable coins
withdraw



*/

/*
list of things to do 

- be able to identify out of place swings(10+ percent)
- paste in and plug in securuty measures for order
- debug
*/
import "./safemath.sol";

    contract formulas{
        
      using SafeMath for uint256;
      
       bool success = true;
       bool failed = false;
       uint avh1;
       uint avh2;
       uint avh3;
       uint avl1;
       uint avl2;
       uint avl3;
       uint allowbuy;
       uint allowsell;

       struct priceHistory{
            uint highestPricethismonth;
            uint highestPrice2MonthsAgo;
            uint highestPrice3MonthsAgo;
            uint highestPrice4MonthsAgo;
            uint lowestPricethismonth;
            uint lowestPrice2MonthsAgo;
            uint lowestPrice3MonthsAgo;
            uint lowestPrice4MonthsAgo;
        }
       priceHistory[] stableCoins;
        
       function addNewCoinStats(
             uint _highestPricethismonth,
            uint _highestPrice2MonthsAgo,
            uint _highestPrice3MonthsAgo,
            uint _highestPrice4MonthsAgo,
            uint _lowestPricethismonth,
            uint _lowestPrice2MonthsAgo,
            uint _lowestPrice3MonthsAgo,
            uint _lowestPrice4MonthsAgo
           )public view {
               priceHistory memory newCoin = priceHistory(
                    _highestPricethismonth,
             _highestPrice2MonthsAgo,
             _highestPrice3MonthsAgo,
             _highestPrice4MonthsAgo,
             _lowestPricethismonth,
             _lowestPrice2MonthsAgo,
             _lowestPrice3MonthsAgo,
             _lowestPrice4MonthsAgo
            );
               stableCoins.push(newCoin);
           }

        
        
       function calculate(
       uint index
           )public view returns(bool,uint){
               
               //function add(uint256 a, uint256 b) internal pure returns (uint256) {
            //   return a + b;
               priceHistory memory coinToReturn = stableCoins[index];
               
               avh1 = coinToReturn.highestPricethismonth.add (coinToReturn.highestPrice2MonthsAgo);
               avh2 = coinToReturn.highestPrice3MonthsAgo.add (coinToReturn.highestPrice4MonthsAgo);
               ahv3 = avh1.add (avh2); avh3/4= allowsell;
               avl1 = coinToReturn.lowestPricethismonth.add (coinToReturn.lowestPrice2MonthsAgo);
               avl2 = coinToReturn.lowestPrice3MonthsAgo.add (coinToReturn.lowestPrice4MonthsAgo);
               avl1 + avl2 = ahl3; avl3/4= allowbuy;
               
               
              return (allowbuy);
              return (allowsell);
              return (success);
            
            }
        
         function safeAverage(uint _Index)public view returns(bool){
             priceHistory memory coinToReturn = stableCoins[_Index];
             coinToReturn.lowestPricethismonth - coinToReturn.lowestPrice2MonthsAgo =c;
             
            if (
    coinToReturn.lowestPrice2MonthsAgo  > (coinToReturn.lowestPricethismonth*0.20)-coinToReturn.lowestPricethismonth 
    ){
                  
            }
            if(coinToReturn.lowestPrice2MonthsAgo  > (coinToReturn.lowestPricethismonth*0.20)-coinToReturn.lowestPricethismonth){
                
            }
            
            /*if min1 is 17% lower than min2 min 1 = extravogant
            if min 2 is 17% lower than min1 = min 2 is extravogant
            if min 3 is lower than extravogant min 1 - 17% is target allowbuy
            //vice versa with max
            else  return string no extravogants, // use mod
        */}
       /* 
         function bart(){
            
        }
        */
        
        
    }
