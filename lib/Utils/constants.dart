// constants/constants.dart

import 'package:flutter/material.dart';

class AppConstants {
  // API URLs (if any)
  static const String baseApiUrl = 'https://api.example.com';

  // Database names
  static const String databaseName = 'timetable_app.db';

  // Common Strings
  static const String appTitle = 'Timetable Generation App';
  static const String coursesTable = 'courses';
  static const String subjectsTable = 'subjects';
  static const String staffTable = 'staff';
  static const String timetableTable = 'timetable';

  // Error messages
  static const String errorEmptyField = 'This field cannot be empty.';
  static const String errorCourseExists = 'Course already exists.';
  static const String errorSubjectExists = 'Subject already exists.';

  // Colors
  static const Color primaryColor = Color(0xFF2196F3);
  static const Color secondaryColor = Color(0xFFFFC107);
  static const Color errorColor = Color(0xFFFF5722);

  // Spacing
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;

  // Timetable Settings
  static const int totalPeriods = 4;  // Total periods in a day
  static const int totalDays = 5;     // Total days in a week
}
