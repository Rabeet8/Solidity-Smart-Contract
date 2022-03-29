//SPDX-LICENSE-IDENTIFIER: MIY
pragma solidity 0.8.4;
contract Todo{
// mapping to store todo for indiviual address
    mapping(address=> string[]) public todos; 
    //add todo function
    function addTodo(string memory _todo) public{
        //add _todo the array of todos for this indivual address(msg.sender)
        todo[msg.sender].push(_todo);
    }

    // get todo function
    function getTodos() public view return (string[] memory){
        return todos[msg.sender];
    }
    // getTodos length function
    function getTodosLength() public view return(uint){
        return todos[msg.sender].length;
    }
    // delTodo function
    function delTodo(uint _idx) public{
        require(_idx < todos[msg.sender].length, "the does not exist");
        todos[msg.sender][_idx] = todos[msg.sender][getTodosLength() - 1]
        todos[msg.sender].pop();
    }
}