import 'package:email_validator/email_validator.dart';

class Validators {
  /// Validate not empty string
  static String? validateNotEmpty(value) {
    final String result = value?.trim() ?? '';

    if (!Validators.isStringNotEmpty(result)) {
      return 'This field is mandatory.';
    }
    return null;
  }

  /// Validate email
  static String? validateEmail(String? value) {
    final String result = value?.trim() ?? '';

    if (!Validators.isStringNotEmpty(result)) {
      return 'Please enter an email address.';
    } else if (!EmailValidator.validate(result)) {
      return 'Enter a valid email address.';
    } else if (result.length < 6) {
      return 'Enter a valid email address.';
    } else {
      return null;
    }
  }

  static bool isStringNotEmpty(value) {
    if (value == null) return false;

    return value.isNotEmpty;
  }

  static bool isListNotEmpty(dynamic list) {
    if (list == null) return false;

    return list.isNotEmpty;
  }

  static bool isNumeric(String? value) {
    if (value == null) {
      return false;
    }

    if (double.tryParse(value) == null) {
      return false;
    }

    return true;
  }
}
