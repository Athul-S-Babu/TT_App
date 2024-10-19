// models/timetable.dart

class Timetable {
  int? id; // Unique ID for each timetable entry
  int courseId; // The ID of the course this timetable belongs to
  int subjectId; // The ID of the subject assigned to this period
  int staffId; // The ID of the staff member assigned to teach this subject
  String day; // Day of the week (e.g., Monday, Tuesday)
  int period; // Period number (e.g., 1, 2, 3, 4)

  Timetable({
    this.id,
    required this.courseId,
    required this.subjectId,
    required this.staffId,
    required this.day,
    required this.period,
  });

  // Convert a Timetable object into a Map object for storing in SQLite
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'courseId': courseId,
      'subjectId': subjectId,
      'staffId': staffId,
      'day': day,
      'period': period,
    };
  }

  // Convert a Map object retrieved from SQLite into a Timetable object
  factory Timetable.fromMap(Map<String, dynamic> map) {
    return Timetable(
      id: map['id'],
      courseId: map['courseId'],
      subjectId: map['subjectId'],
      staffId: map['staffId'],
      day: map['day'],
      period: map['period'],
    );
  }

  // A list of days for the timetable generation
  static const List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
  ];

  // A helper method to get all periods (assuming 4 periods per day)
  static List<int> periods = [1, 2, 3, 4];
}
