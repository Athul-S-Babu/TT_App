// widgets/staff_dropdown.dart

import 'package:flutter/material.dart';
import '../Database/database_helper.dart';
import '../Models/staff.dart'; // Ensure this import is correct

class StaffDropdown extends StatefulWidget {
  final Function(Staff?) onStaffSelected;

  StaffDropdown({required this.onStaffSelected});

  @override
  _StaffDropdownState createState() => _StaffDropdownState();
}

class _StaffDropdownState extends State<StaffDropdown> {
  Staff? selectedStaff;
  List<Staff> staffMembers = [];

  @override
  void initState() {
    super.initState();
    _fetchStaffMembers();
  }

  // Fetch staff members from the database
  Future<void> _fetchStaffMembers() async {
    List<Staff> fetchedStaff = await DatabaseHelper().getStaffMembers();
    setState(() {
      staffMembers = fetchedStaff;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Staff>(
      value: selectedStaff,
      hint: Text('Select a staff member'),
      isExpanded: true,
      items: staffMembers.map((staff) {
        return DropdownMenuItem<Staff>(
          value: staff,
          child: Text(staff.name), // Assuming the Staff model has a 'name' field
        );
      }).toList(),
      onChanged: (Staff? newValue) {
        setState(() {
          selectedStaff = newValue;
        });
        widget.onStaffSelected(newValue); // Notify parent widget
      },
    );
  }
}
