pragma solidity ^0.5.4;

import "ds-test/test.sol";

import "./Delegatecall.sol";

contract DelegatecallTest is DSTest {
    Delegatecall delegatecall;
    E e;

    function setUp() public {
        delegatecall = new Delegatecall();
        e = new E();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }

    function test_call() public {
        delegatecall.callSetN(address(e), 1 ether);
    }

    function test_delegatecall() public {
        delegatecall.delegateSetN(address(e), 1 ether);
    }
}
