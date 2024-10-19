import 'package:sqflite/sqflite.dart';
import '../Models/staff.dart';

import 'database_helper.dart';

class StaffDAO {
  final dbHelper = DatabaseHelper();

  Future<int> addStaff(Staff staff) async {
    final db = await dbHelper.database;
    return await db.insert('staff', staff.toMap());
  }

  Future<List<Staff>> getStaff() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('staff');

    return List.generate(maps.length, (i) {
      return Staff.fromMap(maps[i]);
    });
  }

  Future<int> updateStaff(Staff staff) async {
    final db = await dbHelper.database;
    return await db.update(
      'staff',
      staff.toMap(),
      where: 'id = ?',
      whereArgs: [staff.id],
    );
  }

  Future<int> deleteStaff(int id) async {
    final db = await dbHelper.database;
    return await db.delete(
      'staff',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
