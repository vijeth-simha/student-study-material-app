import 'package:flutter/material.dart';
import 'package:student_study_material/pages/dashboard.dart';
import 'package:student_study_material/pages/documents.dart';
import 'package:student_study_material/pages/login.dart';
import 'package:student_study_material/pages/profile.dart';
import 'package:student_study_material/pages/semesters.dart';
import 'package:student_study_material/pages/signup.dart';
import 'package:student_study_material/pages/subjects.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future main() async {
  await dotenv.load(fileName: ".env");
  runApp(MaterialApp(
    routes: {
      '/': (context) => const Login(),
      '/signup': (context) => const Signup(),
      '/profile': (context) => const ProfilePage(),
      '/dashboard': (context) => const Dashboard(),
      '/semesters': (context) => const SemesterPage(),
      '/subjects': (context) => const SubjectsPage(),
      '/documents': (context) => const DocumentsPage(),
    },
  ));
}
