import 'package:flutter/material.dart';
import '../models/student.dart';
import 'student_item.dart';
import 'NewStudent.dart'; 
import '../utils/student_removal.dart'; 

class StudentsWidget extends StatefulWidget {
  @override
  _StudentsWidgetState createState() => _StudentsWidgetState();
}

class _StudentsWidgetState extends State<StudentsWidget> {
  List<Student> students = [
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

  // Функція для відкриття модального вікна для додавання або редагування студента
  void _openNewStudentModal(BuildContext context, {Student? student}) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewStudent(student: student),
    ).then((newStudent) {
      if (newStudent != null) {
        setState(() {
          if (student != null) {
            // Оновлення існуючого студента
            final index = students.indexOf(student);
            students[index] = newStudent;
          } else {
            // Додавання нового студента
            students.add(newStudent);
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Dismissible(
            key: Key(student.firstName + student.lastName),
            background: Container(
              color: Colors.transparent, // Встановлюємо прозорий фон
              child: Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.only(right: 20.0),
                  child: Text(
                    '🗑️', // Емодзі кошика
                    style: TextStyle(fontSize: 30, color: Colors.red),
                  ),
                ),
              ),
            ),
            onDismissed: (direction) {
              // Викликаємо функцію для видалення студента з Undo
              StudentRemoval.removeStudentWithUndo(context, students, student, () {
                setState(() {});
              });
            },
            child: InkWell(
              onTap: () => _openNewStudentModal(context, student: student), // Викликаємо редагування при натисканні
              child: StudentItem(student: student),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _openNewStudentModal(context),  // Відкриття модального вікна для додавання нового студента
        child: Icon(Icons.add),
      ),
    );
  }
}

