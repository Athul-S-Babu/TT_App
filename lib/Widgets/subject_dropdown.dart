// widgets/subject_dropdown.dart

import 'package:flutter/material.dart';
import '../Database/database_helper.dart';
import '../Models/subject.dart'; // Ensure this path is correct

class SubjectDropdown extends StatefulWidget {
  final Function(Subject?) onSubjectSelected;

  SubjectDropdown({required this.onSubjectSelected});

  @override
  _SubjectDropdownState createState() => _SubjectDropdownState();
}

class _SubjectDropdownState extends State<SubjectDropdown> {
  Subject? selectedSubject;
  List<Subject> subjects = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  // Fetch subjects from the database
  Future<void> _fetchSubjects() async {
    List<Subject> fetchedSubjects = await DatabaseHelper().getSubjects(); // Ensure this method exists
    setState(() {
      subjects = fetchedSubjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Subject>(
      value: selectedSubject,
      hint: Text('Select a subject'),
      isExpanded: true,
      items: subjects.map((subject) {
        return DropdownMenuItem<Subject>(
          value: subject,
          child: Text(subject.name), // Assuming the Subject model has a 'name' field
        );
      }).toList(),
      onChanged: (Subject? newValue) {
        setState(() {
          selectedSubject = newValue;
        });
        widget.onSubjectSelected(newValue); // Notify parent widget
      },
    );
  }
}
