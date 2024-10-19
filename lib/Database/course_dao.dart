import 'package:sqflite/sqflite.dart';
import '../Models/course.dart';

import 'database_helper.dart';

class CourseDAO {
  final dbHelper = DatabaseHelper();

  Future<int> addCourse(Course course) async {
    final db = await dbHelper.database;
    return await db.insert('courses', course.toMap());
  }

  Future<List<Course>> getCourses() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('courses');

    return List.generate(maps.length, (i) {
      return Course.fromMap(maps[i]);
    });
  }

  Future<int> updateCourse(Course course) async {
    final db = await dbHelper.database;
    return await db.update(
      'courses',
      course.toMap(),
      where: 'id = ?',
      whereArgs: [course.id],
    );
  }

  Future<int> deleteCourse(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
