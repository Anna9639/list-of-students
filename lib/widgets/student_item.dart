import 'package:flutter/material.dart';
import '../models/student.dart';
import 'NewStudent.dart'; 

class StudentItem extends StatelessWidget {
  final Student student;

  const StudentItem({Key? key, required this.student}) : super(key: key);

  // Функція для відкриття екрану редагування студента
  void _editStudent(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewStudent(student: student), // Передаємо студента для редагування
    ).then((updatedStudent) {
      if (updatedStudent != null) {
        // Якщо студент змінений, відправляємо дані на оновлення
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Student updated successfully')),
        );
      }
    });
  }

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
        trailing: IconButton(
          icon: Icon(Icons.edit), // Іконка ручки
          onPressed: () => _editStudent(context), // Відкриваємо модальне вікно редагування
        ),
      ),
    );
  }
}