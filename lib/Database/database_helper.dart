// database/database_helper.dart

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../Models/course.dart';
import '../Models/staff.dart';
import '../Models/subject.dart';
import '../Models/timetable.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'timetable.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE subjects(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''').then((_) {
          return db.execute('''
            CREATE TABLE courses(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
            )
          ''');
        }).then((_) {
          return db.execute('''
            CREATE TABLE staff(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              name TEXT NOT NULL
            )
          ''');
        }).then((_) {
          return db.execute('''
            CREATE TABLE timetable(
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              courseId INTEGER,
              subjectId INTEGER,
              staffId INTEGER,
              period INTEGER,
              day INTEGER,
              FOREIGN KEY (courseId) REFERENCES courses (id),
              FOREIGN KEY (subjectId) REFERENCES subjects (id),
              FOREIGN KEY (staffId) REFERENCES staff (id)
            )
          ''');
        });
      },
    );
  }

  // Subject Operations
  Future<List<Subject>> getSubjects() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('subjects');
    return List.generate(maps.length, (i) {
      return Subject.fromMap(maps[i]);
    });
  }

  Future<void> insertSubject(Subject subject) async {
    final db = await database;
    await db.insert(
      'subjects',
      subject.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteSubject(int id) async {
    final db = await database;
    await db.delete(
      'subjects',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Course Operations
  Future<List<Course>> getCourses() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('courses');
    return List.generate(maps.length, (i) {
      return Course.fromMap(maps[i]);
    });
  }

  Future<void> insertCourse(Course course) async {
    final db = await database;
    await db.insert(
      'courses',
      course.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteCourse(int id) async {
    final db = await database;
    await db.delete(
      'courses',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Staff Operations
  Future<List<Staff>> getStaffMembers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('staff');
    return List.generate(maps.length, (i) {
      return Staff.fromMap(maps[i]);
    });
  }

  Future<void> insertStaff(Staff staff) async {
    final db = await database;
    await db.insert(
      'staff',
      staff.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteStaff(int id) async {
    final db = await database;
    await db.delete(
      'staff',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Timetable Operations
  Future<List<Timetable>> getTimetable() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('timetable');
    return List.generate(maps.length, (i) {
      return Timetable.fromMap(maps[i]);
    });
  }

  Future<void> insertTimetable(Timetable timetable) async {
    final db = await database;
    await db.insert(
      'timetable',
      timetable.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> deleteTimetable(int id) async {
    final db = await database;
    await db.delete(
      'timetable',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
