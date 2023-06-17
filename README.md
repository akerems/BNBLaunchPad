# BNBLaunchPad | my patika.dev project on BNB testnet.

## Contract Address: 0xd0d4563d10fb1e591767d007f25fed981c51e0e2
## it costed around 30$, where is the problem?

## My test process in Remix VM

- createProject(Patika,1,1):  <br>
  I create a proejct called Patika <br>
  I want to collect 1 BNB in total to fund the project <br>
  The last parameter means I want my funding to end in 1 hours <br>

- fundProject(1): <br>
  I funded the project with id 1, my msg value was 1 BNB. <br>
    If it was more than 1 BNB, thanks to the conditions in my fundproject function it would refund the exceeded amount <br>
  The parameter isFunded of project with id 1 became true, because it reached the goal amount. <br>
  
- withdrawFunds(1): <br>
  I withdrawed the 1st project's funds to the owner wallet. <br>
  The parameter isWithdrawn of project with id 1 became true; <br>
    0:
    address: creator 0x39eCEc85DF8e2D63456436443Ded27e305184208 <br> 
    1:
    string: projectName Patika <br> 
    2:
    uint256: goalAmount 1 <br>
    3:
    uint256: raisedAmount 1 <br>
    4: 
    uint256: deadline 1687009155 <br>
    5:
    bool: isFunded true <br>
    6:
    bool: isWithdrawn true <br>
    
- getContribution(1): <br>
    uint256: 1 <br>
    it shows the msg.sender's contribution to the project with id 1. <br>
  
- getContributionByAddress(1,0x39eCEc85DF8e2D63456436443Ded27e305184208): <br>
    uint256: 1 <br>
    it shows the contributions by addresses. <br>
  

