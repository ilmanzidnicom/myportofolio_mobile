import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:myportofolio_mobile/screens/menu.dart';
import 'package:myportofolio_mobile/screens/project_form.dart';
import 'package:myportofolio_mobile/screens/education_history_form.dart';
import 'package:myportofolio_mobile/screens/login_screen.dart';
import 'package:myportofolio_mobile/services/auth_state.dart';
import 'package:myportofolio_mobile/widgets/auth_guard.dart';

class DrawerItem {
  final String title;
  final IconData icon;
  final Widget page;
  final bool requiresAuth;

  const DrawerItem({
    required this.title,
    required this.icon,
    required this.page,
    this.requiresAuth = false,
  });
}

class LeftDrawer extends StatelessWidget {
  LeftDrawer({super.key});

  final drawerItems = [
    DrawerItem(title: 'Beranda', icon: Icons.home_outlined, page: MyHomePage()),
    DrawerItem(
      title: 'Add Project',
      icon: Icons.add_circle_outline,
      page: ProjectFormPage(),
      requiresAuth: true,
    ),
    DrawerItem(
      title: 'Add Education History',
      icon: Icons.add_circle_outline,
      page: EducationHistoryFormPage(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = context.watch<AuthState>().isLoggedIn;

    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.indigo),
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
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
              ],
            ),
          ),

          // Generate drawer items
          ...drawerItems.map((item) {
            return ListTile(
              leading: Icon(item.icon),
              title: Text(item.title),
              onTap: () async {
                if (item.requiresAuth) {
                  final loggedIn = await ensureLoggedIn(context);
                  if (!loggedIn || !context.mounted) return;
                }

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => item.page),
                );
              },
            );
          }),

          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text('Login'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()),
                );
              },
            )
          else
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                await context.read<AuthState>().logout();
                if (!context.mounted) return;
                Navigator.pop(context);
              },
            ),
        ],
      ),
    );
  }
}
