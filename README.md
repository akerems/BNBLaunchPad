# BNBLaunchPad
My patika.dev project on BNB Test Network.


My Test Process in Remix VM

createProject(Patika,10,1): 
  I create a proejct called Patika 
  I want to collect 10 BNBs in total to fund the project
  The last parameter means I want my funding to end in 1 hours
  
 fundProject(1):
  I funded the project with id 1, my msg value was 15 BNB.
  Thanks to the conditions in my fundproject function it refunded the 5 BNB to the funder
   The parameter isFunded of project with id 1 became true, because it reached the goal amount.
  
 withdrawFunds(1):
  I withdrawed the 1st project's funds to the owner wallet.
  The parameter isWithdrawn of project with id 1 became true;
    0:
    address: creator 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    1:
    string: projectName Patika
    2:
    uint256: goalAmount 10
    3:
    uint256: raisedAmount 10
    4:
    uint256: deadline 1687009155
    5:
    bool: isFunded true
    6:
    bool: isWithdrawn true
    
  getContribution(1):
    uint256: 10
    it shows the msg.sender's contribution to the project with id 1.
  
  getContributionByAddress(1, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4):
    uint256: 10
    it shows the contributions by addresses.
  

