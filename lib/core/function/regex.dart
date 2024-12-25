class Regex {
  static String? validateEmail(String? email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email!)) {
      return "Invalid email";
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    // Regex for validating phone numbers (e.g., +1234567890, 1234567890)
    final phoneRegex = RegExp(r'^\+?[0-9]{7,15}$');
    if (!phoneRegex.hasMatch(phoneNumber!)) {
      return "Invalid phone number";
    } else {
      return null;
    }
  }

  static String? validateName(String? name) {
    // Regex for validating names (letters, spaces, and some special characters)
    final nameRegex = RegExp(r"^[a-zA-Z\s]{2,50}$");
    if (!nameRegex.hasMatch(name!)) {
      return "Invalid name";
    } else {
      return null;
    }
  }

  static String? validatePassword(String? password) {
    // Regex for validating passwords
    if (password!.isEmpty) {
      return "Invalid password";
    } else {
      return null;
    }
  }
}
