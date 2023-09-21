class Employee {
  Employee(this.name, this.id, this.salary, this.city); 
  String name;
  int id;
  int salary;
  String city;
}

class EmployeeManager {
  Employee getEmployee(int id) {
    //make a REST API call to get the Employee URL
    //we recieve the employee data as a JSON file 
    //deserialization the JSON file into an Employee object 
    //return the Employee object 


    return Employee("mini", 1, 100, "orlando");
  }
}
