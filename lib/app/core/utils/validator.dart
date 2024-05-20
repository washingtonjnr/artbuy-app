class AppValidator {
//   static bool cpf(String value) {
//     return CPFValidator.isValid(value);
//   }

//   static bool cnpj(String value) {
//     return CNPJValidator.isValid(value);
//   }

  // static Future<bool> phone(String value) async {
  //   try {
  //     await PhoneNumberUtil().parse(value);
  //     return true;
  //   } catch (err) {
  //     return false;
  //   }
  // }

  static bool link(String value) {
    return (value).startsWith(RegExp(r"^https?://.+\..+$"));
  }

  static bool email(String value) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+(\.[a-zA-Z]+)+$",
    ).hasMatch(value);
  }

  static bool regex(String regex, String value) {
    return RegExp(regex).hasMatch(value);
  }

  static bool password(String value) {
    if (!RegExp(".*[A-Z].*").hasMatch(value)) {
      return false;
    }
    if (!RegExp(".*[0-9].*").hasMatch(value)) {
      return false;
    }
    if (!RegExp(".*[a-z].*").hasMatch(value)) {
      return false;
    }
    return true;
  }

  static bool words(String value, {int min = 1}) {
    return RegExp(
      // ignore: prefer_interpolation_to_compose_strings
      r"^([^ ]{2,}( +|$)){" + min.toString() + ",}",
      caseSensitive: false,
    ).hasMatch(value);
  }

  static bool name(String value) {
    return AppValidator.words(value, min: 2);
  }

//   static bool office(String value) {
//     return AppValidator.words(value, min: 1);
//   }
}
