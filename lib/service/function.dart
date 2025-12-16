// import 'package:flutter/widgets.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:student_provider/model/student_model.dart';

// ValueNotifier<List<StudentModel>> StudentModelNotifier = ValueNotifier([]);

// Future<void> getData() async {
//   var database = await Hive.openBox<StudentModel>('student');
//   StudentModelNotifier.value.clear();
//   StudentModelNotifier.value.addAll(database.values);
//   StudentModelNotifier.notifyListeners();
// }

// Future<void> addData(StudentModel value) async {
//   var database = await Hive.openBox<StudentModel>('student');
//   await database.add(value);
//   getData();
// }

// Future<void> updateData(int index,StudentModel value) async {
//   var database = await Hive.openBox<StudentModel>('student');
//   await database.putAt(index, value);
//   getData();
// }

// Future<void> deleteData(int index) async {
//   var database = await Hive.openBox<StudentModel>('student');
//   await database.deleteAt(index);
//   getData();
// }

