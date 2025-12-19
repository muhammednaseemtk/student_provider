import 'package:flutter/material.dart';
import 'package:student_provider/core/app_colors.dart';
import 'package:student_provider/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goHome();
  }

  Future<void> goHome() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.shadow,
                    blurRadius: 20,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.Circle,
                radius: 80,
                child: Icon(Icons.school, color: AppColors.icon, size: 80),
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'ClassRoll',
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.w900),
          ),
          SizedBox(height: 5),
          Text('Smart Student Management'),
          SizedBox(height: 100),
          SizedBox(
            height: 25,
            width: 25,
            child: CircularProgressIndicator(color: AppColors.Circle),
          ),
        ],
      ),
    );
  }
}
