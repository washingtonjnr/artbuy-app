import "package:cpf_cnpj_validator/cnpj_validator.dart";
import "package:cpf_cnpj_validator/cpf_validator.dart";

class AppValidator {
  static bool cpf(String cpf) {
    return CPFValidator.isValid(cpf);
  }

  static bool cnpj(String cnpj) {
    return CNPJValidator.isValid(cnpj);
  }

  static bool phone(String phone) {
    RegExp regex = RegExp(r"^\(\d{2}\) \d{5}-\d{4}$");

    return regex.hasMatch(phone);
  }

  static bool link(String link) {
    return (link).startsWith(RegExp(r"^https?://.+\..+$"));
  }

  static bool email(String email) {
    return RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+(\.[a-zA-Z]+)+$",
    ).hasMatch(email);
  }

  static bool regex(String regex, String value) {
    return RegExp(regex).hasMatch(value);
  }

  static bool password(String password) {
    if (!RegExp(".*[A-Z].*").hasMatch(password)) {
      return false;
    }
    if (!RegExp(".*[0-9].*").hasMatch(password)) {
      return false;
    }
    if (!RegExp(".*[a-z].*").hasMatch(password)) {
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

  static bool name(String name) {
    return AppValidator.words(name, min: 2);
  }

//   static bool office(String value) {
//     return AppValidator.words(value, min: 1);
//   }
}
