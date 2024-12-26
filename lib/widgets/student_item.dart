import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: student.gender == Gender.male ? Colors.blue[50] : Colors.pink[50],
      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: ListTile(
        title: Text('${student.firstName} ${student.lastName}'),
        subtitle: Text('Grade: ${student.grade}'),
        leading: Text(
          departmentIcons[student.department]!,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
