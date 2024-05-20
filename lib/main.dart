// Widgets
import 'package:artbuy/app/app_widget.dart';
// Firebase
import 'package:artbuy/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// Flutter
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// dotENV
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  // Active env per release
  if (!kReleaseMode) {
    await dotenv.load(fileName: "assets/envs/.env.debug");
  } else {
    await dotenv.load(fileName: "assets/envs/.env.release");
  }

  // This is necessary to use plugins that depend on the Flutter framework, such as Firebase
  WidgetsFlutterBinding.ensureInitialized();

  // Initialized Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const AppWidget());
}
