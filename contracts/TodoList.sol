pragma solidity ^0.5.0;

contract TodoList{
    uint public taskCount = 0;

    struct Task
    {
        uint id;
        string taskcontent;
        bool completion_status;
    }

    mapping(uint => Task) public tasks;

    event TaskCreated(
        uint id,
        string taskcontent,
        bool completion_status
    );

    event TaskCompleted(
        uint id,
        bool completion_status
    );

    constructor() public {
        createTask("Finish solidity project");
    }

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount,_content, false);
        emit TaskCreated(taskCount,_content, false);
    }

    function toggleCompleted(uint _id) public {
        Task memory _task = tasks[_id];
        _task.completion_status = !_task.completion_status;
        tasks[_id] = _task; 
        emit TaskCompleted(_id, _task.completion_status);
    }
}
