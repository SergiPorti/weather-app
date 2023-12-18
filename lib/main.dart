import 'package:flutter/material.dart';
import 'package:weather_app/config/dependency_injection/locator.dart';
import 'package:weather_app/presentation/screens/main/my_app.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}