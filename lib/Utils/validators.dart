// validators/validators.dart

class Validators {
  // Validate email format
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required.';
    }
    final RegExp emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!emailRegex.hasMatch(value)) {
      return 'Please enter a valid email address.';
    }
    return null; // Return null if valid
  }

  // Validate password length
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required.';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long.';
    }
    return null; // Return null if valid
  }

  // Validate non-empty field
  static String? validateNotEmpty(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required.';
    }
    return null; // Return null if valid
  }

  // Validate phone number format
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required.';
    }
    final RegExp phoneRegex = RegExp(r'^\+?[0-9]{10,15}$');
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter a valid phone number.';
    }
    return null; // Return null if valid
  }

  // Validate course name
  static String? validateCourseName(String? value) {
    return validateNotEmpty(value, 'Course name');
  }

  // Validate subject name
  static String? validateSubjectName(String? value) {
    return validateNotEmpty(value, 'Subject name');
  }

  // Validate staff name
  static String? validateStaffName(String? value) {
    return validateNotEmpty(value, 'Staff name');
  }
}
