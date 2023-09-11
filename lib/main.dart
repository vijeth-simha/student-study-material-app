import 'package:flutter/material.dart';
import 'package:student_study_material/pages/login.dart';

void main() {
  runApp(MaterialApp(
    routes: {'/': (context) => const Login()},
  ));
}
