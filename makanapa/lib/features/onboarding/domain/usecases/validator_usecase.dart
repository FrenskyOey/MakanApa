class ValidatorUsecase {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email cannot be empty.';
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address.';
    }

    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password cannot be empty.';
    }

    if (password.length < 8) {
      return 'Password must be at least 8 characters long.';
    }

    /*
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain an uppercase letter.';
    }

    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain a lowercase letter.';
    }

    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain a number.';
    }

    if (!password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain a special character.';
    }*/

    return null;
  }
}
