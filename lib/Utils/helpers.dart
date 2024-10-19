// helpers/helpers.dart

import 'package:flutter/material.dart';

class HelperFunctions {
  // Format a date to a specific string format
  static String formatDate(DateTime date) {
    // Custom formatting: 'Day, Month Day, Year'
    List<String> weekDays = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
    List<String> months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];

    String day = weekDays[date.weekday % 7]; // Get the day name
    String month = months[date.month - 1]; // Get the month name
    return '$day, $month ${date.day}, ${date.year}'; // Return the formatted date string
  }

  // Validate email format
  static bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  // Show a snack bar message
  static void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blue,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // Validate if a string is empty
  static bool isEmpty(String value) {
    return value.isEmpty;
  }

  // Generate a list of days for timetable
  static List<String> getDaysOfWeek() {
    return ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  }
}
