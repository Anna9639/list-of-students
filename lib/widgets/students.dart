import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';

class StudentsWidget extends StatelessWidget {
  final List<Student> students = [
    Student(
      firstName: 'Eva',
      lastName: 'Sokur',
      department: Department.algebra,
      grade: 8,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Anastasyia',
      lastName: 'Evtushok',
      department: Department.algebra,
      grade: 7,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Yevhenii',
      lastName: 'Petrytsiuk',
      department: Department.algebra,
      grade: 8,
      gender: Gender.male,
    ),
    Student(
      firstName: 'Sofia',
      lastName: 'Savchuk',
      department: Department.algebra,
      grade: 9,
      gender: Gender.female,
    ),

    Student(
      firstName: 'Sofia',
      lastName: 'Reznik',
      department: Department.algebra,
      grade: 8,
      gender: Gender.female,
    ),
    Student(
      firstName: 'Evelin',
      lastName: 'Velychko',
      department: Department.math,
      grade: 6,
      gender: Gender.female,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentItem(student: students[index]);
        },
      ),
    );
  }
}
