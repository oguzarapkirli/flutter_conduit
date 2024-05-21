import 'package:easy_localization/easy_localization.dart';

class AppValidation extends _ValidationFunctions {
  String? validate(String? value, {required List<ValidationType> types}) {
    for (var type in types) {
      String? errorMessage;
      switch (type) {
        case ValidationType.isAlphabetic:
          errorMessage = _isAlphabetic(value);
          break;
        case ValidationType.isNumeric:
          errorMessage = _isNumeric(value);
          break;
        case ValidationType.isNumericOrNull:
          errorMessage = _isNumericOrNull(value);
          break;
        case ValidationType.isEmail:
          errorMessage = _isEmail(value);
          break;
        case ValidationType.isEmpty:
          errorMessage = _isEmpty(value);
        case ValidationType.isInteger:
          errorMessage = _isInteger(value);
        case ValidationType.isStrongPassword:
          errorMessage = _strongPassword(value);
      }
      if (errorMessage != null) {
        return errorMessage;
      }
    }
    return null;
  }
}

class _ValidationFunctions {
  String? _isInteger(String? value) {
    try {
      int.parse(value!);
      return null;
    } catch (e) {
      return "please_enter_whole_number".tr();
    }
  }

  String? _isEmpty(String? value) {
    if (value!.isEmpty) {
      return "please_enter_value".tr();
    }
    return null;
  }

  String? _isNumeric(String? value) {
    try {
      num.parse(value ?? '');
      return null;
    } catch (e) {
      return "please_enter_valid_number".tr();
    }
  }

  String? _isNumericOrNull(String? value) {
    if (value == null) return null;
    return _isNumeric(value);
  }

  String? _isAlphabetic(String? value) =>
      RegExp(r'[\p{L}]+', unicode: true).hasMatch(value ?? '')
          ? null
          : "please_enter_valid_value".tr();

  String? _isEmail(String? value) =>
      RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
              .hasMatch(value ?? '')
          ? null
          : "please_enter_valid_email".tr();

  String? _strongPassword(String? value) =>
      RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&\-+/.,])[A-Za-z\d@$!%*?&\-+/.,]{8,}$')
              .hasMatch(value ?? '')
          ? null
          : "please_enter_strong_password".tr();
}

enum ValidationType {
  isEmpty,
  isNumeric,
  isNumericOrNull,
  isEmail,
  isAlphabetic,
  isInteger,
  isStrongPassword
}
