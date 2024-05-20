import 'package:artbuy/app/data/models/user_model.dart';

class UserAdapter {
  static Map<String, dynamic> toJson(UserModel model) {
    return {
      'cpf': model.cpf,
      'name': model.name,
      'email': model.email,
      'phone': model.phone,
    };
  }

  static UserModel fromJson(Map<String, dynamic> map) {
    return UserModel(
      cpf: map['cpf'] ?? '-',
      name: map['name'] ?? '-',
      email: map['email'] ?? '-',
      phone: map['phone'] ?? '-',
    );
  }
}
