class ValidatorUsecase {
  String? validateEmail(String email) {
    if (email.isEmpty) {
      return 'Email tidak boleh kosong.';
    }

    final emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~-]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );

    if (!emailRegex.hasMatch(email)) {
      return 'Harap masukkan alamat email yang valid.';
    }

    return null;
  }

  String? validateUserName(String name) {
    if (name.isEmpty) {
      return 'Nama tidak boleh kosong.';
    }
    if (name.length < 3) {
      return 'Nama harus memiliki minimal 3 karakter.';
    }
    return null;
  }

  String? validatePhoneNumber(String phoneNumber) {
    if (phoneNumber.isEmpty) {
      return 'Nomor telepon tidak boleh kosong.';
    }

    final phoneRegex = RegExp(r'^(?:\+62|0)8[1-9][0-9]{7,10}$');

    if (!phoneRegex.hasMatch(phoneNumber)) {
      return 'Harap masukkan nomor telepon Indonesia yang valid.';
    }
    return null;
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return 'Password tidak boleh kosong.';
    }

    if (password.length < 8) {
      return 'Password harus memiliki minimal 8 karakter.';
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
