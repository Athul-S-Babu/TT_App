import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_common_ffi_web/sqflite_ffi_web.dart';

import 'Ui/course_screen.dart';
import 'Ui/home_screen.dart';
import 'Ui/staff_screen.dart';
import 'Ui/subject_screen.dart';
import 'Ui/timetable_screen.dart';


void main() {
  databaseFactory = databaseFactoryFfi;
  databaseFactory = databaseFactoryFfiWeb;
  runApp(TimetableApp());
}

class TimetableApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable Generation App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/courses': (context) => CourseScreen(),
        '/subjects': (context) => SubjectScreen(),
        '/staff': (context) => StaffScreen(),
        '/timetable': (context) => TimetableScreen(),
      },
    );
  }
}
