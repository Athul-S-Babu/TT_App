// screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:timetable_app/Ui/staff_screen.dart';
import 'package:timetable_app/Ui/subject_screen.dart';

import 'course_screen.dart';
import 'timetable_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable Management'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CourseScreen()),
                );
              },
              child: Text('Add Course'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SubjectScreen()),
                );
              },
              child: Text('Add Subject'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StaffScreen()),
                );
              },
              child: Text('Add Staff'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TimetableScreen()),
                );
              },
              child: Text('View Timetable'),
            ),
          ],
        ),
      ),
    );
  }
}
