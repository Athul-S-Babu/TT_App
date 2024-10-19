import 'package:sqflite/sqflite.dart';
import '../Models/subject.dart';

import 'database_helper.dart';

class SubjectDAO {
  final dbHelper = DatabaseHelper();

  Future<int> addSubject(Subject subject) async {
    final db = await dbHelper.database;
    return await db.insert('subjects', subject.toMap());
  }

  Future<List<Subject>> getSubjects(int courseId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'subjects',
      where: 'courseId = ?',
      whereArgs: [courseId],
    );

    return List.generate(maps.length, (i) {
      return Subject.fromMap(maps[i]);
    });
  }

  Future<int> updateSubject(Subject subject) async {
    final db = await dbHelper.database;
    return await db.update(
      'subjects',
      subject.toMap(),
      where: 'id = ?',
      whereArgs: [subject.id],
    );
  }

  Future<int> deleteSubject(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'subjects',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
