import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentRemoval {
  static void removeStudentWithUndo(
    BuildContext context, 
    List<Student> students, 
    Student student, 
    Function updateState
  ) {
    // Зберігаємо видаленого студента
    Student? lastRemovedStudent = student;

    // Видаляємо студента зі списку
    students.remove(student);
    updateState();

    // Показуємо SnackBar з кнопкою Undo
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${student.firstName} ${student.lastName} deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Якщо користувач натискає "Undo", відновлюємо студента
            students.add(lastRemovedStudent);
            updateState();
          },
        ),
      ),
    );
  }
}
