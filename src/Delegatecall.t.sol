pragma solidity ^0.5.4;

import "ds-test/test.sol";

import "./Delegatecall.sol";

contract DelegatecallTest is DSTest {
    Delegatecall delegatecall;

    function setUp() public {
        delegatecall = new Delegatecall();
    }

    function testFail_basic_sanity() public {
        assertTrue(false);
    }

    function test_basic_sanity() public {
        assertTrue(true);
    }
}
