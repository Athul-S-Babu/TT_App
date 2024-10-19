// screens/subject_screen.dart

import 'package:flutter/material.dart';
import '../Database/database_helper.dart';
import '../Models/subject.dart';
import '../widgets/subject_dropdown.dart'; // Ensure this import is correct

class SubjectScreen extends StatefulWidget {
  @override
  _SubjectScreenState createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  final TextEditingController _subjectController = TextEditingController();
  List<Subject> subjects = [];

  @override
  void initState() {
    super.initState();
    _fetchSubjects();
  }

  // Fetch subjects from the database
  Future<void> _fetchSubjects() async {
    List<Subject> fetchedSubjects = await DatabaseHelper().getSubjects();
    setState(() {
      subjects = fetchedSubjects;
    });
  }

  // Add a new subject
  Future<void> _addSubject() async {
    if (_subjectController.text.isNotEmpty) {
      Subject newSubject = Subject(name: _subjectController.text);
      await DatabaseHelper().insertSubject(newSubject); // Ensure this method exists
      _subjectController.clear();
      _fetchSubjects(); // Refresh the list of subjects
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Subjects'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _subjectController,
              decoration: InputDecoration(
                labelText: 'Subject Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _addSubject,
              child: Text('Add Subject'),
            ),
            SizedBox(height: 20),
            Text('Existing Subjects:', style: TextStyle(fontSize: 18)),
            Expanded(
              child: ListView.builder(
                itemCount: subjects.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(subjects[index].name),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () async {
                        await DatabaseHelper().deleteSubject(subjects[index].id!); // Ensure this method exists
                        _fetchSubjects(); // Refresh the list
                      },
                    ),
                  );
                },
              ),
            ),
            SubjectDropdown(
              onSubjectSelected: (selectedSubject) {
                // Handle subject selection if needed
              },
            ),
          ],
        ),
      ),
    );
  }
}
