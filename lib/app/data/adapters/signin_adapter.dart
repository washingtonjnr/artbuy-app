import 'package:artbuy/app/data/models/signin_model.dart';

class SigninAdapter {
  static Map<String, dynamic> toJson(SigninModel model) {
    return {
      'email': model.email,
      'password': model.password,
    };
  }

  static SigninModel fromJson(Map<String, dynamic> map) {
    return SigninModel(
      email: map['email'],
      password: map['password'],
    );
  }
}
