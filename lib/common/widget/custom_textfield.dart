import 'package:flutter/material.dart';
import 'package:student_provider/core/app_colors.dart';
class CustomTextField extends StatelessWidget {
  final String text;
  final String text1;
  final FormFieldValidator<String>? validator;
  final TextEditingController controller;
  final bool obsecureValue;
  const CustomTextField({super.key, required this.text, required this.text1,required this.controller,required this.validator,this.obsecureValue = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(text, style: TextStyle(color: AppColors.icon)),
          ),
          TextFormField(
            cursorColor: AppColors.icon,
            obscureText: obsecureValue,
            controller: controller,
            validator: validator,
            decoration: InputDecoration(
              hintStyle: TextStyle(color: AppColors.icon),
              hintText: text1,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.icon)
              )
            ),
          ),
        ],
      ),
    );
  }
}