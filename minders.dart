void main(List<String> args) {
  Manager m =
      Manager("Amr Yousry", 28, "201157799093", 15000, "Mobile Department");

  Employee e1 = Employee("Muhammed", 20, "201275277770", 4800, "Mobile");
  e1.isAttend = true;

  Employee e2 = Employee("Ahmed", 21, "201123400366", 4800, "Mobile");
  Employee e3 = Employee("Ibrahim", 22, "201207892593", 4800, "Mobile");

  m.Employees.addAll([e1, e2, e3]);

  m.AddTaskToSpecificEmployee(e1, Task("Test 1"));
  m.AddTaskToSpecificEmployee(e1, Task("Test 2"));

  m.ShowAllEmployees();

  e1.Tasks[0].DeliverTask();

  m.ShowAllEmployees();

  print('');

  print(
      'Number of employees that ${m.Name} is manage is ${m.numberOfEmployees()} Employee.');
}

class Person {
  String? Name;
  int? Age;
  String? Phone;
  double? Salary;
  String? Section;
  bool isAttend = false;

  Person({this.Name, this.Age, this.Phone, this.Salary, this.Section});
}

class Task {
  String? TaskName;
  bool Delivered = false;

  Task(this.TaskName);

  void printTaskInfo() {
    print('Task Name: $TaskName - StatusOfDelivery: $Delivered');
  }

  void DeliverTask() {
    this.Delivered = true;
  }
}

class Employee extends Person {
  List<Task> Tasks = [];

  Employee(
      String? Name, int? Age, String? Phone, double? Salary, String? Section)
      : super(
            Name: Name,
            Age: Age,
            Phone: Phone,
            Salary: Salary,
            Section: Section);

  String getTasks() {
    if (Tasks.length > 0) {
      List<String> x = [];
      for (Task t in Tasks) {
        x.add("Task Name: ${t.TaskName} - StatusOfDelivery: ${t.Delivered}");
      }
      return x.join(" / ");
    } else {
      return "NO TASKS";
    }
  }

  void printInfo() {
    print(
        'Info { Name: $Name - Age: $Age - Phone: $Phone - Salary: $Salary - Section: $Section - isAttended: $isAttend } Tasks { ${getTasks()} }');
  }
}

class Manager extends Person {
  List<Employee> Employees = [];
  int numberOfEmployees() => Employees.length;

  Manager(
      String? Name, int? Age, String? Phone, double? Salary, String? Section)
      : super(
            Name: Name,
            Age: Age,
            Phone: Phone,
            Salary: Salary,
            Section: Section);

  void AddTaskToSpecificEmployee(Employee e, Task t) {
    e.Tasks.add(t);
  }

  void ShowAllEmployees() {
    print('This is list of employees that the manager {$Name} is manages:');
    for (Employee e in Employees) {
      e.printInfo();
    }
    print('');
  }
}
