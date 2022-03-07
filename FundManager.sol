// imports for safemath, erc20, etc

contract FundManager {

    // arbitrary based on audits, whitepaper, historic trends, etc
    // 0,1,3,4,5
    enum TrustRatings {
        None,
        Low, 
        Medium,
        High,
        VeryHigh
    }
    
    // add connection/strategy
    IConnection[] connections;
    // check for if profitable

    uint256 totalAssetsinWETH;
    mapping (IERC20[] => uint256) totalAssetsinTokens;

    mapping (IConnection => bool) rebalanceNeeded;

    struct ConnectionData {
        bool trustRating; // or grade like Rari pools
        uint256 balance;
    }

    uint256 totalFarmed;

    // multiSig modifier for high trust functions
    modifier onlyMS() {
        require(multiSigAddr == msg.sender, "Only wallet can call this function");
        _;
    }

    /*
    * adding connections/strategies
    */
    function addConnection() public returns (IConnection connection) {}

    /*
    * removing connections/strategies
    */
    function removeConnection() public returns (IConnection connection) {}


    // overall deposit/withdraw
    function deposit(uint256 amount) external {};
    function withdraw(uint256 amount) external {};

    function transferBetweenConnections(IConnection _from, IConnection _to, uint256 _amount) internal {
        // withdrawFromConnection()
        // depositIntoConnection();
    };

    // 
    function checkForRebalance() {
        // estRewards[i] = connection[i].estimateFarmingRewards() 
        // weighted[i] = estRewards[i] * trustRatings
        // weightedTotal = sum(weighted)
        // if (weighted[i]/ weightedTotal > actualAllocation - epsilon || weighted[i]/ weightedTotal < actualAllocation - epsilon )
        //  rebalanceNeeded(connection[i]) = true;
    }

    function rebalance () {
        // for each connection
        //  if (rebalanceNeeded[connection])
        //   check for closest difference and transferBteweenConnections()
        // rebalanceNeeded[connection] = false;
    }



    function depositIntoConnection(IConnection connection, uint256 amount) external onlyMS { 
    };

    function withdrawFromConnection(IConnection connection, uint256 amount) external onlyMS {
        // check for best trust rating
    };

    function RageQuitAllConnections() external onlyMS {};

}