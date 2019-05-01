pragma solidity ^0.5.4;

contract DEvents {
    event LogSender(
        address sender,
        uint n
    );

    event LogResponse(
        bool success,
        bytes data
    );
}


contract Delegatecall is DEvents {
  uint public n;
  address public sender;

  function delegateSetN(address _e, uint _n) public {
    emit LogSender(msg.sender, _n);
    emit LogSender(sender, n);
    // D's storage is set, E is not modified
    (bool success, bytes memory data) = _e.delegatecall(abi.encodePacked(bytes4(keccak256("setN(uint256)")), _n));
    emit LogResponse(success, data);
    emit LogSender(sender, n);
  }

  function callSetN(address _e, uint _n) public {
    emit LogSender(msg.sender, _n);
    (bool success, bytes memory data) = _e.call(abi.encodeWithSignature("setN(uint)", _n));
    emit LogResponse(success, data);
  }

}

contract E {
  uint public n;
  address public sender;

  function setN(uint _n) public {
    n = _n;
    sender = msg.sender;
  }
}
