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
  int categoryId = 0;
  Semester semester = Semester();
  List<SemesterSchema> semesterList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    // print('test............$routeArguments');
    categoryId = routeArguments["categoryId"];

    initializeSemesterList(categoryId);
  }

  void initializeSemesterList(int categoryId) async {
    // print('semesterList $semesterList');

    await semester.getAllSemesters(categoryId.toString());
    setState(() {
      semesterList = semester.semesterList;
    });
  }

  void navigateToSubjectsPage(semesterId) {
    if (mounted) {
      Navigator.pushNamed(context, "/subjects",
          arguments: {'semesterId': semesterId});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Semester"),
      ),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1),
          itemCount: semesterList.length,
          itemBuilder: ((context, index) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 180, // Adjust the width as needed
                height: 300,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.white,
                  elevation: 0.4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () => navigateToSubjectsPage(semesterList[index].id),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              semesterList[index].semesterPic,
                              width: double.maxFinite,
                              height: 110,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            semesterList[index].title,
                            style: const TextStyle(fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ]);
          })),
    );
  }
}
