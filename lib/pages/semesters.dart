import 'package:flutter/material.dart';
import 'package:student_study_material/models/semester.dart';
import 'package:student_study_material/services/api_services.dart';

class SemesterPage extends StatefulWidget {
  const SemesterPage({super.key});

  @override
  State<SemesterPage> createState() => _SemesterPageState();
}

class _SemesterPageState extends State<SemesterPage> {
  Map<String, dynamic> routeArguments = {};
  int categoryId = 3;
  Semester semester = Semester();
  List<SemesterSchema> semesterList = [];

  @override
  void initState() {
    super.initState();
    initializeSemesterList();
  }

  void initializeSemesterList() async {
    // print('semesterList $semesterList');

    await semester.getAllSemesters(categoryId.toString());
    setState(() {
      semesterList = semester.semesterList;
    });
  }

  @override
  Widget build(BuildContext context) {
    routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print('test............$routeArguments');
    categoryId = routeArguments["categoryId"];
    print('semesterList $semesterList');

    return Scaffold(
      appBar: AppBar(
        title: const Text("Semester"),
      ),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1),
          itemCount: 3,
          itemBuilder: ((context, index) {
            return const Row(
              children: [Text("dsoids")],
            );
          })),
    );
  }
}
