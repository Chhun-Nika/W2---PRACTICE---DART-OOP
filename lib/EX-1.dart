enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String _street;
  final String _city;
  final String _zipCode;

  Address(this._street, this._city, this._zipCode);

  String get street => this._street;
  String get city => this._city;
  String get zipCode => this._zipCode;
}

class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final int _yearsOfExperience;
  final Address _address;

  Employee(this._name, this._baseSalary, this._skills, this._yearsOfExperience, this._address);

  Employee.mobileDeveloper(String name, double baseSalary, int yearsOfExperience, Address address) : 
    this._name = name, 
    this._baseSalary = baseSalary,
    this._skills = [Skill.DART, Skill.FLUTTER],
    this._yearsOfExperience = yearsOfExperience,
    this._address = address;
    
  // provide getter for each attributes since those are private attributes
  String get name => this._name;
  double get baseSalary => this._baseSalary;
  List<Skill> get skills => this._skills;
  int get yearsOfExperience => this._yearsOfExperience;
  Address get address => this._address;

  // add method to compute the salary
  double get totalSalary {
    double totalSalary = _baseSalary + (_yearsOfExperience * 2000);
    // skills 
    for(Skill skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          totalSalary += 5000;
        case Skill.DART:
          totalSalary += 3000;
        case Skill.OTHER:
          totalSalary += 1000;
      }
    }
    return totalSalary;
  }
  void printDetails() {
    print('- Employee: $_name\n- Address: ${_address._street}, ${_address._city}, ${_address._zipCode} \n- Base Salary: \$${_baseSalary}\n- Skills: ${skills.map((s) => s.name).join(", ")}\n- Total salary: \$$totalSalary\n');
  }
}

void main() {
  var address1 = Address('123 Riverside Blvd', 'Phnom Penh', '12000');

  var emp1 = Employee('Sokea', 40000, [Skill.FLUTTER], 10, address1);
  emp1.printDetails();

  var address2 = Address('St. 271', 'Phnom Penh', '12345');
  var emp2 = Employee.mobileDeveloper('Ronan', 45000, 20, address2);
  emp2.printDetails();
}