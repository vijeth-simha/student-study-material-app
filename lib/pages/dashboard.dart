// import 'package:student_study_material/services/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:student_study_material/models/categories.dart';
import 'package:student_study_material/services/api_services.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: ListView.builder(
          itemCount: categories.categoriesList.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: double.maxFinite,
                child: Column(children: [Text(categoriesList[index].title)]),
              ),
            );
          })),
      drawer: const NavigationDrawer(),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            const Divider(color: Color.fromARGB(179, 243, 0, 0)),
            ListTile(
              title: const Text('Types'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      );
}
