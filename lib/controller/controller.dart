import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_provider/model/student_model.dart';

class StudentController extends ChangeNotifier {
  List<StudentModel> data = [];
  bool isLoading = false;

  late Box<StudentModel> studentBox;

  late TextEditingController nameController;
  late TextEditingController classController;
  late TextEditingController gradeController;

  void setEditData(StudentModel student) {
    nameController = TextEditingController(text: student.studentName);
    classController = TextEditingController(text: student.studentClass);
    gradeController = TextEditingController(text: student.studentGrade);
  }

  void updateStudentData(int index) {
    final updatedStudent = StudentModel(
      studentName: nameController.text.trim(),
      studentClass: classController.text.trim(),
      studentGrade: gradeController.text.trim(),
    );
    updateStudent(index, updatedStudent);
  }

  Future<void> initDb() async {
    studentBox = await Hive.openBox<StudentModel>('student');
    getData();
  }

  void getData() async {
    isLoading = true;
    notifyListeners();
    data = studentBox.values.toList();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }

  Future<void> addStudent(StudentModel value) async {
    await studentBox.add(value);
    getData();
  }

  Future<void> updateStudent(int index, StudentModel value) async {
    await studentBox.putAt(index, value);
    getData();
  }

  Future<void> deleteStudent(int index) async {
    await studentBox.deleteAt(index);
    getData();
  }
}
