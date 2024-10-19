// database/app_database.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  static final AppDatabase _instance = AppDatabase._internal();
  static Database? _database;

  // Private constructor
  AppDatabase._internal();

  // Singleton instance
  factory AppDatabase() {
    return _instance;
  }

  // Initialize the database and create tables if they don't exist
  Future<Database> get database async {
    if (_database != null) return _database!;

    // Initialize the database if not already done
    _database = await _initDatabase();
    return _database!;
  }

  // Helper method to initialize the database
  Future<Database> _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String path = join(dbPath, 'timetable_app.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        // Create tables for courses, subjects, staff, and timetable
        await db.execute('''
          CREATE TABLE courses (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE subjects (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL,
            courseId INTEGER,
            FOREIGN KEY (courseId) REFERENCES courses (id)
          )
        ''');

        await db.execute('''
          CREATE TABLE staff (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT NOT NULL
          )
        ''');

        await db.execute('''
          CREATE TABLE timetable (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            courseId INTEGER,
            subjectId INTEGER,
            staffId INTEGER,
            day TEXT,
            period INTEGER,
            FOREIGN KEY (courseId) REFERENCES courses (id),
            FOREIGN KEY (subjectId) REFERENCES subjects (id),
            FOREIGN KEY (staffId) REFERENCES staff (id)
          )
        ''');
      },
    );
  }

  // Close the database when it's no longer needed
  Future<void> close() async {
    final db = await database;
    db.close();
  }
}
