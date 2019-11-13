pragma solidity ^0.5.0;

import "./SafeMath.sol";

contract ERC20 {
    using SafeMath for uint256;
    string public name = "ERC20 TOKEN";
    string public symbol = "TOK";
    uint public decimals = 18;
    uint private _totalSupply = 10;
    mapping (address => uint256) private _balances;
    mapping (address => mapping(address => uint)) private _allowances;
    event Transfer(address indexed from, address indexed to, uint256);
    event Approval(address indexed owner, address indexed spender, uint256 value);
    
    constructor() public {
        _balances[msg.sender] = _totalSupply;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender) public view returns (uint256) {
        return _allowances[owner][spender];
    }
    
    function approve(address spender, uint256 amount) public returns (bool) {
        require(msg.sender != address(0),"Address 0, vérifiez votre address !");
        require(spender != address(0), "Address 0, vérifiez votre address !");
        emit Approval(msg.sender, spender, amount);
        return true;
    }
    
    function transferFrom(address sender, address recipient, uint256 amount) public returns (bool) {
        require(msg.sender != address(0), "Address 0, vérifiez votre address !");
        require(recipient != address(0), "Address 0, vérifiez votre address !");
        _balances[msg.sender] >= amount;
        _balances[recipient] += amount;
        _allowances[msg.sender][sender] >= amount;
        return true;
     }
    
    function transfer(address recipient, uint256 amount) public returns (bool) {
        require(msg.sender != address(0), "Address 0, vérifiez votre address !");
        require(recipient != address(0), "Address 0, vérifiez votre address !");
        require(_balances[msg.sender] >= amount, "Vérifiez votre balance");
        _balances[recipient] += amount;
        _balances[msg.sender] -= amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }
}