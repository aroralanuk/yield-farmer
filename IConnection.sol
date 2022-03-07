

abstract contract IConnection {
    IERC20[] depositTokens;
    IERC20[] rewardToken;
    // harvest window in seconds
    uint256 harvestWindow;
    address connectionAddr;
    address multiSigAddr;


    uint256 depositAmount;
    uint256 tvl;
    uint256 aprBPS;


    // multiSig modifier for high trust functions
    modifier onlyMS() {
        require(multiSigAddr == msg.sender, "Only wallet can call this function");
        _;
    }

    /**
     * estimated current token balance deployed
     * @return deposit tokens
     */
    function getBalance() external virtual view returns (uint);

    /**
     * get APR in BPS
     * @return deposit tokens
     */
    function getAPR() external virtual view returns (uint);


    /**
     * allowance for approval for depositing in pools
     * @param token address
     * @param spender address
     */
    function setAllowance(address token, address spender) public virtual;

     /**
     * revoke token allowance
     * @param token address
     * @param spender address
     */
    function revokeAllowance(address token, address spender) external onlyMS {
        require(IERC20(token).approve(spender, 0));
    }

    /**
     * deposit and deploy deposits tokens to the connection
     * @param amount deposit tokens
     */
    function deposit(uint amount) external payable virtual;

    /**
     * widthdraw LP tokens from the connection
     * @param amount LP
     */
    function withdraw(uint amount) external payable virtual;

    /**
     * force liquidate the connection
     * @param amount LP
     */
    function rageQuit() external payable onlyMS{
        uint256 totalBal = getBalance();
        withdraw(totalBal);

        (bool sent, bytes memory data) = multiSigAddr.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    };

    function estimateFarmingRewards(IConnection) external view {
        // apr x amount invested / harvestWindow
    }


    /**
     * reward tokens
     * @return reward tokens
     */
    function checkReward() public virtual view returns (uint256);


    /**
     * reinvest reward tokens back
     */
    function reinvest() external payable virtual;

    f

}