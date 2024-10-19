import 'package:flutter/material.dart';
import '../Database/course_dao.dart';
import '../Models/course.dart';


class CourseScreen extends StatefulWidget {
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  final CourseDAO _courseDAO = CourseDAO();
  final TextEditingController _controller = TextEditingController();
  List<Course> _courses = [];

  @override
  void initState() {
    super.initState();
    _loadCourses();
  }

  Future<void> _loadCourses() async {
    final courses = await _courseDAO.getCourses();
    setState(() {
      _courses = courses;
    });
  }

  void _addCourse() async {
    if (_controller.text.isNotEmpty) {
      final newCourse = Course(name: _controller.text);
      await _courseDAO.addCourse(newCourse);
      _controller.clear();
      _loadCourses();
    }
  }

  void _deleteCourse(int id) async {
    await _courseDAO.deleteCourse(id);
    _loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Courses'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Course Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addCourse,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_courses[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteCourse(_courses[index].id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
