import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future<void> signup() {
    final response = await http.post(
      Uri.parse('https://your-backend-api.com/api/auth/signup'),
      headers: {"Content-Type": "application/json"},
      body: json
    )
  }
}