import 'package:flutter/material.dart';
import 'package:student_provider/core/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: CircleAvatar(
              backgroundColor: AppColors.Circle,
              radius: 80,
              child: Icon(
                Icons.school,
                color: AppColors.iconColor,
                size: 80,
              ),
            ),
          ),
          SizedBox(height: 15),
          Text(
            'ClassRoll',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 5),
          Text('Smart Student Management'),
          SizedBox(height: 100,),
          SizedBox(
            height: 20,
            width: 30,
            child: CircularProgressIndicator(
              color: AppColors.Circle,
            ),
          ),
        ],
      ),
    );
  }
}
