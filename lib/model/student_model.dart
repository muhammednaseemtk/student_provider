import 'package:hive/hive.dart';

part 'student_model.g.dart';

@HiveType(typeId: 0)
class StudentModel {
  @HiveField(0)
  String studentName;

  @HiveField(1)
  String studentClass;

  @HiveField(2)
  String classGrade;

StudentModel({
  required this.studentName,
  required this.studentClass,
required this.classGrade
});
}