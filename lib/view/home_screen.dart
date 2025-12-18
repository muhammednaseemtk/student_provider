import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_provider/controller/controller.dart';
import 'package:student_provider/core/app_colors.dart';
import 'package:student_provider/model/student_model.dart';
import 'package:student_provider/view/add_screen.dart';
import 'package:student_provider/view/edit_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    Provider.of<StudentController>(context, listen: false).initDb();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Students',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Consumer<StudentController>(
                builder: (context, value, _) {
                  if (value.isLoading) {
                    return Center(
                      child: CircularProgressIndicator(color: AppColors.Circle),
                    );
                  } else if (value.data.isEmpty) {
                    return Center(child: Text("no data added"));
                  }

                  return ListView.builder(
                    itemCount: value.data.length,
                    itemBuilder: (context, i) {
                      final index = value.data.length - 1 - i;
                      final data = value.data[index];
                      return Card(
                        color: Colors.white,
                        margin: EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 5,
                        ),
                        child: ListTile(
                          title: Text(data.studentName),
                          subtitle: Text(
                            'Class: ${data.studentClass} | Grade: ${data.studentGrade}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.edit,
                                  color: AppColors.iconColor,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => EditScreen(
                                        student: data,
                                        index: index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: AppColors.iconColor,
                                ),
                                onPressed: () {
                                  context
                                      .read<StudentController>()
                                      .deleteStudent(index);
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(28.0),
        child: FloatingActionButton(
          backgroundColor: AppColors.Circle,
          child: Icon(Icons.add, color: AppColors.iconColor),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddScreen()),
            );
          },
        ),
      ),
    );
  }
}
