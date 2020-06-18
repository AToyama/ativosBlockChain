pragma solidity >=0.4.22 <0.7.0;

/**
 * @title Storage
 * @dev Store & retreive value in a variable
 */
contract Storage {

    address public owner;
    uint256[][] flights = [[3213, 0], [5674, 0], [6421, 0], [8532, 0], [1287, 0]];
    address payable[5][100] clients;

    function buyInsurence(uint256 flightNumber) public returns (bool success){
        
        for (uint i=0; i<flights.length; i++) {
             if (flights[i][0] == flightNumber) {
                for (uint j=0; j<clients[i].length; j++) {
                    if (clients[i][j] != msg.sender){
                        clients[i][j] = (msg.sender);
                        return true;
                    }
                }
            }
        }
    }
    
    function changeFlightStatus(uint256 flightNumber, uint256 flightStatus) public payable returns (bool) {
        
      uint256 amount = 2;
    	
      for (uint i=0; i < flights.length; i++) {
          
      	if (flights[i][0] == flightNumber && flights[i][1] != flightStatus) {
      	    
          
          if (flights[i][1] == 0) {
          	
            for (uint j=0; j < clients[i].length; j++) {
              if (flightStatus == 1) {
              	    clients[i][j].transfer(amount);
            	}
              if (flightStatus == 2) {
              	    clients[i][j].transfer(2*amount);
                }
            }
          }
        flights[i][1] = flightStatus;
        return true;
        }
      }
    }

  
    //   function getlist() public view returns (uint256){
    //     return flights[0][1];
    // }
    
    // function getclient() public view returns (address){
    //     return clients[0][0];
    // }
    
    // function getadd() public view returns (address){
    //     return msg.sender;
    // }
    
    // function getbale() public view returns (uint256){
    //     return clients[0][0].balance;
    // }
  
  
    // function retreive() public view returns (uint256){
    //     return flights[0][0];
    // }
}
