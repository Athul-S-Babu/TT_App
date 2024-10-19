import 'package:flutter/material.dart';
import '../Database/staff_dao.dart';
import '../Models/staff.dart';

class StaffScreen extends StatefulWidget {
  @override
  _StaffScreenState createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  final StaffDAO _staffDAO = StaffDAO();
  final TextEditingController _controller = TextEditingController();
  List<Staff> _staffList = [];

  @override
  void initState() {
    super.initState();
    _loadStaff();
  }

  Future<void> _loadStaff() async {
    final staffList = await _staffDAO.getStaff();
    setState(() {
      _staffList = staffList;
    });
  }

  void _addStaff() async {
    if (_controller.text.isNotEmpty) {
      final newStaff = Staff(name: _controller.text);
      await _staffDAO.addStaff(newStaff);
      _controller.clear();
      _loadStaff();
    }
  }

  void _deleteStaff(int id) async {
    await _staffDAO.deleteStaff(id);
    _loadStaff();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Manage Staff'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Staff Name',
                suffixIcon: IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addStaff,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _staffList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_staffList[index].name),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _deleteStaff(_staffList[index].id!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
