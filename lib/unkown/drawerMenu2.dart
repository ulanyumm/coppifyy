import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';
import 'package:hypotenuse/screen/integrations.dart';
import 'package:hypotenuse/screen/plansAndPricing.dart';
import 'package:hypotenuse/screen/profileScreen.dart';
import 'package:hypotenuse/screen/referAUserScreen.dart';
import 'package:hypotenuse/widgets/profileButton.dart';

class DrawerMenu2 extends StatelessWidget {
  const DrawerMenu2({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
          child: ListView(padding: EdgeInsets.only(top: 40), children: <Widget>[
        Text(
          "Copify AI",
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.home),
          ),
          title: Text("Home"),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
        ),
        Text('Account',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.menu_book),
          ),
          title: Text("Profile"),
          onTap: () {},
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.description),
          ),
          title: Text("Plans and Pricing"),
          onTap: () {},
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.book_rounded),
          ),
          title: Text("Integrations"),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => IntegrationsScreen()),
            );
          },
        ),
        Text('Account',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
        ListTile(
          trailing: Icon(Icons.lock_clock),
          leading: CircleAvatar(
            child: Icon(Icons.person_2_sharp),
          ),
          title: Text("Members"),
          onTap: () {},
        ),
        SizedBox(
          height: 70,
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.circle),
          ),
          title: Text("15 Credits"),
          onTap: () {},
        ),
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.settings),
          ),
          title: Text("Settings"),
          onTap: () {},
        ),
        SizedBox(height: 10),
        ExpansionTile(
          leading: ProfileButton(),
          title: Text("Default"),
          trailing: Icon(
            Icons.arrow_drop_down,
          ),
          children: [
            ListTile(
              leading: Icon(Icons.flag),
              title: Text('Profile'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ProfileScreen()),
                );
              },
            ),
            ListTile(
                leading: Icon(Icons.graphic_eq),
                title: Text('Plans & Pricing'),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlansAndPricingScreen(),
                      ));
                }),
            ListTile(
              leading: Icon(Icons.man),
              title: Text('Refer a User'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ReferAUserScreen()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.outbond),
              title: Text('Sign Out'),
            )
          ],
        )
      ]));
}
