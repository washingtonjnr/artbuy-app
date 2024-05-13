import 'package:flutter/material.dart';
// Injector
import 'package:artbuy/app/injector.dart';
// Widgets
import 'package:artbuy/app/app_widget.dart';

void main() {
  // Injector
  registerInstances();

  runApp(const AppWidget());
}
