class SigninModel {
  final String email;
  final String password;

  SigninModel({
    required this.email,
    required this.password,
  });

  SigninModel copyWith({
    required String email,
    required String password,
  }) {
    return SigninModel(
      email: this.email,
      password: this.password,
    );
  }
}
