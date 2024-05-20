import 'package:artbuy/app/data/models/signup_model.dart';

class UserModel extends SignUpModel {
  final String? id;
  final String? avatar;

  UserModel({
    this.id,
    this.avatar,
    // Requireds
    required super.cpf,
    required super.name,
    required super.email,
    required super.phone,
  });

  @override
  SignUpModel copyWith({
    required String cpf,
    required String name,
    required String email,
    required String phone,
  }) {
    return UserModel(
      id: id,
      avatar: avatar,
      // Requireds
      cpf: this.cpf,
      name: this.name,
      email: this.email,
      phone: this.phone,
    );
  }
}
