import 'package:cityseedapp/login.dart';
import 'package:flutter/material.dart'; // Ensure to import your login.dart file

void main() {
  runApp(CitySeedApp());
}

class CitySeedApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CitySeed',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: LoginPage(), // Start with LoginPage
    );
  }
}
