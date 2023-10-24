import 'package:flutter/material.dart';
import 'package:student_study_material/pages/dashboard.dart';
import 'package:student_study_material/pages/login.dart';
import 'package:student_study_material/pages/semesters.dart';
import 'package:student_study_material/pages/signup.dart';
import 'package:student_study_material/pages/subjects.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Login(),
      '/signup': (context) => const Signup(),
      '/dashboard': (context) => const Dashboard(),
      '/semesters': (context) => const SemesterPage(),
      '/subjects': (context) => const SubjectsPage(),
    },
  ));
}
