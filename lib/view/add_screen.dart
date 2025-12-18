import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/common/widget/common_button.dart';
import 'package:student_provider/common/widget/custom_textfield.dart';
import 'package:student_provider/controller/controller.dart';
import 'package:student_provider/core/app_colors.dart';
import 'package:student_provider/model/student_model.dart';

class AddScreen extends StatelessWidget {
  AddScreen({super.key});
  final TextEditingController studentNameController = TextEditingController();
  final TextEditingController studentClassController = TextEditingController();
  final TextEditingController studentGradeController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text('Add Screen'),
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
                  controller: studentNameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'name is required';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  text: 'Student Class',
                  text1: 'type class',
                  controller: studentClassController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'class is required';
                    } else {
                      return null;
                    }
                  },
                ),
                CustomTextField(
                  text: 'Student Grade',
                  text1: 'type grade',
                  controller: studentGradeController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'grade is required';
                    } else {
                      return null;
                    }
                  },
                ),
              ],
            ),
            Column(
              children: [
                CommonButton(
                  text: 'Save',
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final student = StudentModel(
                        studentName: studentNameController.text.trim(),
                        studentClass: studentClassController.text.trim(),
                        studentGrade: studentGradeController.text.trim(),
                      );

                      Provider.of<StudentController>(
                        context,
                        listen: false,
                      ).addStudent(student);

                      Navigator.pop(context);
                    }
                  },
                  textColor: AppColors.icon,
                  bgColor: AppColors.Circle,
                ),
                SizedBox(height: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
