pragma solidity >=0.4.0 < 0.8.0;

contract SolulabToken{
    string public name="Solulab Token";
    string public symbol = "SOL";
    uint256 public totalSupply;
    
    mapping(address=>uint256) balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;
    
    event Transfer(
        address indexed _from,
        address indexed _to,
        uint _value);
        
    event Approval(
        address indexed _owner,
        address indexed _spender,
        uint256 _value
        );
    
    function SolToken() public {
        totalSupply = 100000000;
        balanceOf[msg.sender]=totalSupply;
    }
    
    function transfer(address _to, uint256 _value) public returns (bool success) 
        require(balanceOf[msg.sender] >=_value);
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        Transfer(msg.sender, _to, _value);
        return true;
    }
    
    function approve(address _spender, uint256 _value) public returns(bool success){
        allowance[msg.sender][_spender] = _value;
        Approval(msg.sender, _spender, _value);
        return true;
    }
    
    function transferFrom(address -from, address _to, uint256 _value) public returns (bool success){
        require(_value <= balanceOf[_from]);
        require(_value <= allowance[_from][msg.sender]);
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        Transfer(_from, _to, _value);
        return true;
    }
