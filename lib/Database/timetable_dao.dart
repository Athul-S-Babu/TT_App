import 'package:sqflite/sqflite.dart';
import 'database_helper.dart';

class TimetableDAO {
  final dbHelper = DatabaseHelper();

  Future<int> addTimetableEntry(
      String day,
      int period,
      int courseId,
      int subjectId,
      int staffId,
      ) async {
    final db = await dbHelper.database;
    return await db.insert('timetable', {
      'day': day,
      'period': period,
      'courseId': courseId,
      'subjectId': subjectId,
      'staffId': staffId,
    });
  }

  Future<List<Map<String, dynamic>>> getTimetableForCourse(int courseId) async {
    final db = await dbHelper.database;
    return await db.query(
      'timetable',
      where: 'courseId = ?',
      whereArgs: [courseId],
    );
  }

  Future<int> updateTimetableEntry(
      int id,
      String day,
      int period,
      int courseId,
      int subjectId,
      int staffId,
      ) async {
    final db = await dbHelper.database;
    return await db.update(
      'timetable',
      {
        'day': day,
        'period': period,
        'courseId': courseId,
        'subjectId': subjectId,
        'staffId': staffId,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteTimetableEntry(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'timetable',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
