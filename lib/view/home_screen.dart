import 'package:flutter/material.dart';
import 'package:student_provider/core/app_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        title: Text('Student List',style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: AppColors.Circle,
      ),
      body: Column(),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FloatingActionButton(
          onPressed: (){},
          backgroundColor: AppColors.Circle,
        child: Icon(Icons.add,color: AppColors.iconColor,),
        ),
      ),
    );
  }
}