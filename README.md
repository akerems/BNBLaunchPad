# BNBLaunchPad | my patika.dev project on BNB testnet.

## My test process in Remix VM

- createProject(Patika,10,1):  <br>
  I create a proejct called Patika <br>
  I want to collect 10 BNBs in total to fund the project <br>
  The last parameter means I want my funding to end in 1 hours <br>

- fundProject(1): <br>
  I funded the project with id 1, my msg value was 15 BNB. <br>
  Thanks to the conditions in my fundproject function it refunded the 5 BNB to the funder <br>
   The parameter isFunded of project with id 1 became true, because it reached the goal amount. <br>
  
- withdrawFunds(1): <br>
  I withdrawed the 1st project's funds to the owner wallet. <br>
  The parameter isWithdrawn of project with id 1 became true; <br>
    0:
    address: creator 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 <br> 
    1:
    string: projectName Patika <br> 
    2:
    uint256: goalAmount 10 <br>
    3:
    uint256: raisedAmount 10 <br>
    4: 
    uint256: deadline 1687009155 <br>
    5:
    bool: isFunded true <br>
    6:
    bool: isWithdrawn true <br>
    
- getContribution(1): <br>
    uint256: 10 <br>
    it shows the msg.sender's contribution to the project with id 1. <br>
  
- getContributionByAddress(1, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4): <br>
    uint256: 10 <br>
    it shows the contributions by addresses. <br>
  

