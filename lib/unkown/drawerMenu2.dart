import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';
import 'package:hypotenuse/unkown/integrations.dart';
import 'package:hypotenuse/widgets/plansAndPricing/plansAndPricing.dart';
import 'package:hypotenuse/unkown/referAUserScreen.dart';
import 'package:hypotenuse/screen/settingsScreen.dart';
import 'package:hypotenuse/widgets/profileButton.dart';

class DrawerMenu2 extends StatelessWidget {
  const DrawerMenu2({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(padding: const EdgeInsets.only(top: 40), children: <Widget>[
        const Text(
          "Copify AI",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.home),
          ),
          title: const Text("Home"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const DashboardScreen()));
          },
        ),
        const Text('Account',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.menu_book),
          ),
          title: const Text("Profile"),
          onTap: () {},
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.description),
          ),
          title: const Text("Plans and Pricing"),
          onTap: () {},
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.book_rounded),
          ),
          title: const Text("Integrations"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const IntegrationsScreen()),
            );
          },
        ),
        const Text('Account',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ListTile(
          trailing: const Icon(Icons.lock_clock),
          leading: const CircleAvatar(
            child: Icon(Icons.person_2_sharp),
          ),
          title: const Text("Members"),
          onTap: () {},
        ),
        const SizedBox(
          height: 70,
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.circle),
          ),
          title: const Text("15 Credits"),
          onTap: () {},
        ),
        ListTile(
          leading: const CircleAvatar(
            child: Icon(Icons.settings),
          ),
          title: const Text("Settings"),
          onTap: () {},
        ),
        const SizedBox(height: 10),
        ExpansionTile(
          leading: const ProfileButton(),
          title: const Text("Default"),
          trailing: const Icon(
            Icons.arrow_drop_down,
          ),
          children: [
            ListTile(
              leading: const Icon(Icons.flag),
              title: const Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SettingsScreen()),
                );
              },
            ),
            ListTile(
                leading: const Icon(Icons.graphic_eq),
                title: const Text('Plans & Pricing'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlansAndPricingScreen(),
                      ));
                }),
            ListTile(
              leading: const Icon(Icons.man),
              title: const Text('Refer a User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReferAUserScreen()),
                );
              },
            ),
            const ListTile(
              leading: Icon(Icons.outbond),
              title: Text('Sign Out'),
            )
          ],
        )
      ]));
}
