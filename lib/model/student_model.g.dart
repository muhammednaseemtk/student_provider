// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class StudentModelAdapter extends TypeAdapter<StudentModel> {
  @override
  final int typeId = 0;

  @override
  StudentModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return StudentModel(
      studentName: fields[1] as String,
      studentClass: fields[2] as String,
      studentGrade: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, StudentModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.studentName)
      ..writeByte(2)
      ..write(obj.studentClass)
      ..writeByte(3)
      ..write(obj.studentGrade);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is StudentModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
