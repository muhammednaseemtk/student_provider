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
    controller.setEditData(student);
    return Scaffold(
      backgroundColor: AppColors.background,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is required';
                    }else{
                      return null;
                    }
                  }
                ),
                CustomTextField(
                  text: 'Student Class',
                  text1: 'type class',
                  controller: controller.classController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'class is required';
                    } else {
                      return null;
                    }
                  }
                ),
                CustomTextField(
                  text: 'Student Grade',
                  text1: 'type grade',
                  controller: controller.gradeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'grade is required';
                    } else {
                      return null;
                    }
                  }
                ),
              ],
            ),
            Column(
              children: [
                CommonButton(
                   text: 'Update',
                   textColor: AppColors.icon,
                   bgColor: AppColors.Circle,
                   onTap: () {
                     if (formKey.currentState!.validate()) {
                       controller.updateStudentData(index);
                       Navigator.pop(context);
                     }
                   },
                 ),
                 SizedBox(height: 30,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
