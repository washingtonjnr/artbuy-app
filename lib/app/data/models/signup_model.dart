class SignUpModel {
  final String cpf;
  final String name;
  final String email;
  final String phone;

  SignUpModel({
    required this.cpf,
    required this.name,
    required this.email,
    required this.phone,
  });

  SignUpModel copyWith({
    required String cpf,
    required String name,
    required String email,
    required String phone,
  }) {
    return SignUpModel(
      cpf: this.cpf,
      name: this.name,
      email: this.email,
      phone: this.phone,
    );
  }
}
