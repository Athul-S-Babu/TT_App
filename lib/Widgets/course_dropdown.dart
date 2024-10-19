// widgets/course_dropdown.dart

import 'package:flutter/material.dart';
import 'package:timetable_app/Database/course_dao.dart';
import '../Models/course.dart';



class CourseDropdown extends StatefulWidget {
  final Function(Course?)? onChanged;
  final Course? selectedCourse;

  const CourseDropdown({Key? key, this.onChanged, this.selectedCourse}) : super(key: key);

  @override
  _CourseDropdownState createState() => _CourseDropdownState();
}

class _CourseDropdownState extends State<CourseDropdown> {
  List<Course> _courses = [];
  Course? _selectedCourse;

  @override
  void initState() {
    super.initState();
    _fetchCourses();
    _selectedCourse = widget.selectedCourse;
  }

  Future<void> _fetchCourses() async {
    final courseDao = CourseDAO();
    final courses = await courseDao.getCourses();
    setState(() {
      _courses = courses;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Course>(
      value: _selectedCourse,
      hint: Text('Select Course'),
      onChanged: (Course? newValue) {
        setState(() {
          _selectedCourse = newValue;
        });
        if (widget.onChanged != null) {
          widget.onChanged!(newValue);
        }
      },
      items: _courses.map<DropdownMenuItem<Course>>((Course course) {
        return DropdownMenuItem<Course>(
          value: course,
          child: Text(course.name),
        );
      }).toList(),
    );
  }
}
