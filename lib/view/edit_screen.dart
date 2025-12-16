import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/common/widget/common_button.dart';
import 'package:student_provider/common/widget/custom_textfield.dart';
import 'package:student_provider/controller/controller.dart';
import 'package:student_provider/core/app_colors.dart';
import 'package:student_provider/model/student_model.dart';

class EditScreen extends StatelessWidget {
  final StudentModel student;
  final int index;

  EditScreen({
    super.key,
    required this.student,
    required this.index,
  });

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = context.read<StudentController>();

    // set initial data ONCE
    controller.setEditData(student);

    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Edit Student'),
        centerTitle: true,
        backgroundColor: AppColors.Circle,
      ),
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                CustomTextField(
                  text: 'Student Name',
                  text1: 'type name',
                  controller: controller.nameController,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'name is required' : null,
                ),
                CustomTextField(
                  text: 'Student Class',
                  text1: 'type class',
                  controller: controller.classController,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'class is required' : null,
                ),
                CustomTextField(
                  text: 'Student Grade',
                  text1: 'type grade',
                  controller: controller.gradeController,
                  validator: (v) =>
                      v == null || v.isEmpty ? 'grade is required' : null,
                ),
                 CommonButton(
                   text: 'Update',
                   textColor: AppColors.iconColor,
                   bgColor: AppColors.Circle,
                   onTap: () {
                     if (formKey.currentState!.validate()) {
                       controller.updateStudentData(index);
                       Navigator.pop(context);
                     }
                   },
                 ),
              ],
            ),
           
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
