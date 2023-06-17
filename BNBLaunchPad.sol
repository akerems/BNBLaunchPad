// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract Launchpad {

    using Counters for Counters.Counter;
    Counters.Counter private _counter;

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    struct Project {
        address creator;
        string projectName;
        uint goalAmount; //in BNB
        uint raisedAmount; //in BNB
        uint deadline;
        bool isFunded;
        bool isWithdrawn;
        mapping(address => uint) contributions;
    }

    mapping(uint => Project) public projects;
    

    
    event ProjectCreated(uint projectId, string projectName, uint goalAmount, uint deadline);
    event ProjectFunded(uint projectId, uint amount);
    event ProjectWithdrawn(uint projectId, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the project creator can withdraw funds");
        _;
    }

    function createProject(string memory _projectName, uint _goalAmount, uint _deadline) external {

        _counter.increment();
        uint counter = _counter.current();


        //here _deadline is in hours to simplify the process and it is added to current timestamp
        uint _newDeadline = block.timestamp + _deadline * 60 * 60;

        Project storage project = projects[counter];
        project.creator = msg.sender;
        project.projectName = _projectName;
        project.goalAmount = _goalAmount;
        project.deadline = _newDeadline;
        
        emit ProjectCreated(counter, _projectName, _goalAmount, _deadline);
    }

    function fundProject(uint _projectId) external payable {

        Project storage project = projects[_projectId];

        require(project.creator != address(0), "ICO does not exist");
        require(!project.isFunded, "Max funding is reached");
        require(block.timestamp <= project.deadline, "ICO deadline has passed");
        
        //BNB to wei
        uint remainingAmount = SafeMath.mul(project.goalAmount, 10**18) - SafeMath.mul(project.raisedAmount, 10**18);
        uint contribution = msg.value;

        if (contribution > remainingAmount) { // The last one who called this function will get the remaining amount instead of the contribution amount
            contribution = remainingAmount;
        }

        uint refundAmount = msg.value - contribution;

        if (refundAmount > 0) {
            payable(msg.sender).transfer(refundAmount);
        }


        project.contributions[msg.sender] += SafeMath.div(contribution, 10**18);
        project.raisedAmount += SafeMath.div(contribution, 10**18);

        if (project.raisedAmount >= project.goalAmount) {
            project.isFunded = true;
        }
        
        emit ProjectFunded(_projectId, SafeMath.div(contribution, 10**18));
        
    }

    function withdrawFunds(uint _projectId) external onlyOwner {

        Project storage project = projects[_projectId];

        require(project.isFunded, "ICO is not over yet");
        
        uint balance = address(this).balance;

        require(balance > 0, "No funds available to withdraw");
        
        uint amount = SafeMath.mul(project.raisedAmount, 10**18);

        payable(msg.sender).transfer(amount);

        project.isWithdrawn = true;
        
        emit ProjectWithdrawn(_projectId, amount);
    }


    function getContribution(uint _projectId) external view returns(uint) {
        Project storage project = projects[_projectId];
        return project.contributions[msg.sender];
    }

    function getContributionByAddress(uint _projectId, address _account) external view returns(uint) {
        Project storage project = projects[_projectId];
        return project.contributions[_account];
    }
}
