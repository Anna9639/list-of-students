enum Department {
  math,
  physics,
  algebra,
}

enum Gender {
  male,
  female,
}

const Map<Department, String> departmentIcons = {
  Department.math: '🔢',
  Department.physics: '🍎',
  Department.algebra: '🧮',
};

class Student {
  final String firstName;
  final String lastName;
  final Department department;
  final int grade;
  final Gender gender;

  Student({
    required this.firstName,
    required this.lastName,
    required this.department,
    required this.grade,
    required this.gender,
  });
}
