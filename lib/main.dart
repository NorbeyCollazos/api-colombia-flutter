import 'package:api_colombia/core/app_colors.dart';
import 'package:api_colombia/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.surface,
          title: Text('API - Colombia'),
        ),
        backgroundColor: AppColors.background,
        body: HomeScreen()
      ),
    );
  }
}
