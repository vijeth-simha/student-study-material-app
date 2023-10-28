import 'package:flutter/material.dart';
import 'package:student_study_material/models/subject.dart';
import 'package:student_study_material/services/api_services.dart';

class SubjectsPage extends StatefulWidget {
  const SubjectsPage({super.key});

  @override
  State<SubjectsPage> createState() => _SubjectsPageState();
}

class _SubjectsPageState extends State<SubjectsPage> {
  Map<String, dynamic> routeArguments = {};
  int semesterId = 0;
  Subject subject = Subject();
  List<SubjectSchema> subjectsList = [];

  void didChangeDependenies() {
    super.didChangeDependencies();
    routeArguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    semesterId = routeArguments["semesterId"];
    initiateSubjectsList(semesterId);
  }

  void initiateSubjectsList(int semesterid) async {
    await subject.getAllSemesters(semesterid.toString());
    setState(() {
      subjectsList = subject.subjectsList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Subjects"),
      ),
      body: ListView.builder(
          itemCount: 3,
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.maxFinite,
                    height: 60,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12.0),
                        onTap: () {},
                        child: Row(
                          children: [
                            Image.network(subjectsList[index].subjectPic),
                            Text(subjectsList[index].title)
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          })),
    );
  }
}
