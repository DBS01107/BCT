// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Student {

    // Structure to store student details
    struct Student {
        uint256 rollNo;
        string name;
        uint256 age;
    }

    // Array to store student records
    Student[] public students;

    // Add student details
    function addStudent(
        uint256 _rollNo,
        string memory _name,
        uint256 _age
    ) public {
        students.push(Student(_rollNo, _name, _age));
    }

    // Retrieve student details
    function getStudent(uint256 index)
        public
        view
        returns (uint256, string memory, uint256)
    {
        require(index < students.length, "Invalid index");

        Student memory s = students[index];

        return (s.rollNo, s.name, s.age);
    }

    // Return total number of students
    function getStudentCount() public view returns (uint256) {
        return students.length;
    }

    // Fallback function
    fallback() external payable {
    }
}
