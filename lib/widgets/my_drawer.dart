import 'package:flutter/material.dart';
import 'package:food_delivery_app/screens/login_screen.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/widgets/my_drawer_tile.dart';
import 'package:food_delivery_app/screens/setting_screen.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() async {
    final authService = AuthService();
    await authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Drawer(
      backgroundColor: colorScheme.surface,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 70.0),
            child: Image.asset(
              'assets/images/logo_nobg.png',
              height: 150,
              width: 150,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Divider(
            color: colorScheme.secondary,
            indent: 15,
            endIndent: 15,
          ),
          const SizedBox(
            height: 20,
          ),
          MyDrawerTile(
            title: "HOME",
            icon: Icons.home,
            onTap: () {
              Navigator.pop(context);
            },
          ),
          MyDrawerTile(
            title: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SettingScreen()));
            },
          ),
          const Spacer(),
          MyDrawerTile(
            title: "LOGOUT",
            icon: Icons.logout,
            onTap: () async {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text("Logout"),
                    content: const Text("Are you sure you want to logout?"),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("No"),
                      ),
                      TextButton(
                        onPressed: () async {
                          logout();
                          await Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                        onTap: () {},
                                      )));
                        },
                        child: const Text("Yes"),
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
