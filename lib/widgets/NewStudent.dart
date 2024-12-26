import 'package:flutter/material.dart';
import '../models/student.dart';

class NewStudent extends StatefulWidget {
  final Student? student; // Можливо редагування існуючого студента

  NewStudent({Key? key, this.student}) : super(key: key);

  @override
  _NewStudentState createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _gradeController = TextEditingController();

  Department? _selectedDepartment;
  Gender? _selectedGender;

  @override
  void initState() {
    super.initState();
    // Якщо є студент для редагування, заповнюємо поля
    if (widget.student != null) {
      _firstNameController.text = widget.student!.firstName;
      _lastNameController.text = widget.student!.lastName;
      _gradeController.text = widget.student!.grade.toString();
      _selectedDepartment = widget.student!.department;
      _selectedGender = widget.student!.gender;
    }
  }

  void _saveStudent() {
    // Тут можна обробити збереження студенту, або редагування
    final newStudent = Student(
      firstName: _firstNameController.text,
      lastName: _lastNameController.text,
      department: _selectedDepartment!,
      grade: int.parse(_gradeController.text),
      gender: _selectedGender!,
    );
    // Логіка для збереження студенту або редагування
    // Наприклад, додавання до списку або збереження в базі даних
    Navigator.pop(context, newStudent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null ? 'Add New Student' : 'Edit Student'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name'),
            ),
            TextField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name'),
            ),
            TextField(
              controller: _gradeController,
              decoration: InputDecoration(labelText: 'Grade'),
              keyboardType: TextInputType.number,
            ),
  DropdownButton<Department>(
              value: _selectedDepartment,
              hint: Text('Select Department'),
              onChanged: (Department? newValue) {
                setState(() {
                  _selectedDepartment = newValue;
                });
              },
              items: Department.values.map<DropdownMenuItem<Department>>((Department value) {
                return DropdownMenuItem<Department>(
                  value: value,
                  child: Row(
                    children: [
                      Text(departmentIcons[value]!, style: TextStyle(fontSize: 24)),
                      SizedBox(width: 10),
                      Text(value.toString().split('.').last.toUpperCase()), // Підпис департаменту
                    ],
                  ),
                );
              }).toList(),
            ),
            DropdownButton<Gender>(
              value: _selectedGender,
              hint: Text('Select Gender'),
              onChanged: (Gender? newValue) {
                setState(() {
                  _selectedGender = newValue;
                });
              },
              items: Gender.values.map<DropdownMenuItem<Gender>>((Gender value) {
                return DropdownMenuItem<Gender>(
                  value: value,
                  child: Text(value == Gender.male ? 'Male' : 'Female'),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _saveStudent,
              child: Text(widget.student == null ? 'Add Student' : 'Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
