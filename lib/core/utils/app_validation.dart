import 'package:test_app/core/utils/app_regex.dart';

class AppValidation {
  static String? nameValidation(String? name) {
    if ((name != null) && (name.trim().isEmpty)) {
      return "Provide your Name";
    }
    return null;
  }

  static String? emailValidation(String? email) {
    if ((email != null) && (email.trim().isEmpty)) {
      return "Provide your Email ID";
    } else if ((email != null) &&
        !AppRegex.email.hasMatch(email.trim())) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? passwordValidation(String? password) {
    if (password!.trim().isEmpty) {
      return "Provide your Password";
    } else if (!AppRegex.password.hasMatch(password.trim())) {
      return "Password should contain 1 UpperCase and 1 LowerCase Letter, 1 Special Character and 1 Digit Number";
    }
    return null;
  }

  static String? confirmPasswordValidation(String? confirmPassword, String? password) {
    if (confirmPassword!.trim().isEmpty) {
      return "Provide your Confirmation Password";
    } else if (!AppRegex.password.hasMatch(confirmPassword.trim())) {
      return "Password should contain 1 UpperCase Letter, 1 Special Character, 1 Digit Number";
    } else if ((password != null) && confirmPassword != password) {
      return "Confirm Password should be same as password";
    }
    return null;
  }
}
