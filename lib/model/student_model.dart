import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(1)
  String studentName;

  @HiveField(2)
  String studentClass;

  @HiveField(3)
  String studentGrade;

  StudentModel({
    required this.studentName,
    required this.studentClass,
    required this.studentGrade,
  });
}
