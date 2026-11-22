import 'package:material_ui/material_ui.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/education_history_form.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget page;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.page,
  });
}

class LeftDrawer extends StatelessWidget {
  LeftDrawer({super.key});

  final drawerItems = [
    DrawerItem(
      title: 'Beranda',
      icon: Icons.home_outlined,
      page: MyHomePage(),
    ),
    DrawerItem(
      title: 'Add Project',
      icon: Icons.add_circle_outline,
      page: ProjectFormPage(),
    ),
    DrawerItem(
      title: 'Add Education History',
      icon: Icons.add_circle_outline,
      page: EducationHistoryFormPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.indigo,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My Portfolio',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Explore personal projects and experiences!',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Generate drawer items
          ...drawerItems.map((item) {
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => item.page),
                );
              },
            );
          }),

        ],
      ),
    );
  }
}