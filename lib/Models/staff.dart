// models/staff.dart

class Staff {
  final int? id;
  final String name;

  Staff({this.id, required this.name});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Staff.fromMap(Map<String, dynamic> map) {
    return Staff(
      id: map['id'],
      name: map['name'],
    );
  }
}
