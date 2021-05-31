pragma solidity >=0.4.0 < 0.8.0;
import "./SolulabToken.sol";

contract SolulabTokenSale{
    address admin;
    uint256 public tokenPrice;
    uint256 public tokenSold;
    uint256 limit = 30000000;
   // uint256 limit2 = 50000000;
    
    SolulabToken public tokenContract;
    
    event Sell(address _buyer, uint256 _amount);
    function SolulabTokenSale(SolulabToken _tokenContract, uint256 _tokenPrice) public {
        admin = msg.sender;
        tokenContract = _tokenContract;
        tokenPrice= 42026298719915;
    }
    
    function update(uint256 _limit, uint _tokenPrice) public {
        require(msg.sender == admin);
        tokenPrice = _tokenPrice; // 0.2 dollars
        limit = _limit;           // 50 million
    }
    function buyTokens(uint256 _numOfTokens) public payable update(){
        
        require(msg.value == _numOfTokens * tokenPrice);
        require(tokenContract.balanceOf(this) >= _numOfTokens);
        require(tokenSold+_numOfTokens<=limit);
        require(tokenContract.transfer(msg.sender, _numberOfTokens));
        
        tokenSold += _numOfTokens;
        
        Sell(msg.sender, _numOftokens);;
    }
    
    function endSale() public {
        require(msg.sender == admin);
        require(tokenContract.transfer(admin, tokenContract.balanceOf(this)));
        
        admin.transfer(address(this).balance);
    }
}
