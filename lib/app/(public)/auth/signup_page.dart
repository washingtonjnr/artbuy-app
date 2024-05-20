import 'package:flutter/material.dart';

class SignupPageWidget extends StatefulWidget {
  const SignupPageWidget({super.key});

  @override
  State<SignupPageWidget> createState() => _SignupPageWidgetState();
}

class _SignupPageWidgetState extends State<SignupPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.red,
        ),
      ),
    );
  }
}
