// import 'package:student_study_material/services/storage_service.dart';

import 'package:flutter/material.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({Key? key}) : super(key: key);

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
