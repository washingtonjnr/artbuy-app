import 'package:artbuy/app/data/models/signup_model.dart';

class SignupAdapter {
  static Map<String, dynamic> toJson(SignUpModel model) {
    return {
      'cpf': model.cpf,
      'name': model.name,
      'email': model.email,
      'phone': model.phone,
    };
  }

  static SignUpModel fromJson(Map<String, dynamic> map) {
    return SignUpModel(
      cpf: map['cpf'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }
}
