// import 'package:student_study_material/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:student_study_material/models/categories.dart';
import 'package:student_study_material/services/api_services.dart';
import 'package:student_study_material/widgets/navigation_drawer.dart';
// import 'package:student_study_material/models/storage_items.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var categories = Category();
  List<CategorySchema> categoriesList = [];
  // late List<StorageItem> _items;
  // final StorageService _storageService = StorageService();

  @override
  void initState() {
    super.initState();
    initList();
  }

  void initList() async {
    // _items = await _storageService.readAllSecureData();
    await categories.getAllCategories();
    setState(() {
      categoriesList = categories.categoriesList;
    });
  }

  void navigateToSemesters(int categoryId) {
    if (mounted) {
      Navigator.pushNamed(context, '/semesters',
          arguments: {'categoryId': categoryId});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: GridView.builder(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1,
          ),
          itemCount: categoriesList.length,
          itemBuilder: ((context, index) {
            return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 180, // Adjust the width as needed
                height: 250,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0)),
                  color: Colors.white,
                  elevation: 0.4,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () => navigateToSemesters(categoriesList[index].id),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          ClipRRect(
                            child: Image.network(
                              'https://dashboard.vijethsimha.com/dynamic/category-images/${categoriesList[index].categoryPic}',
                              width: double.maxFinite,
                              height: 130,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            categoriesList[index].title,
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
      drawer: const NavigationMenu(),
    );
  }
}
