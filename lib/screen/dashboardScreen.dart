import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/widgets/recommendedTools.dart';
import 'package:hypotenuse/widgets/unlockCard.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dashboard',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text('Welcome back, user!'),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            UnlockCard(),
            SizedBox(
              height: 20,
            ),
            RecommendedTools(),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Quick actions',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                leading: Container(
                  height: double.infinity,
                  child: SvgPicture.asset(
                      'assets/images/icons/product-descriptions.svg',
                      height: 30),
                ),
                title: Text("Product descriptions",
                    style: TextStyle(
                      fontSize: 13,
                    )),
                subtitle:
                    Text('Organize and manage you products within a catalog',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                tileColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                leading: Container(
                  height: double.infinity,
                  child: SvgPicture.asset('assets/images/icons/blog.svg',
                      height: 30),
                ),
                title: Text("Product descriptions",
                    style: TextStyle(
                      fontSize: 13,
                    )),
                subtitle:
                    Text('Organize and manage you products within a catalog',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                tileColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                leading: Container(
                  height: double.infinity,
                  child: SvgPicture.asset('assets/images/icons/ads.svg',
                      height: 30),
                ),
                title: Text("Product descriptions",
                    style: TextStyle(
                      fontSize: 13,
                    )),
                subtitle:
                    Text('Organize and manage you products within a catalog',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                tileColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 7,
            ),
            Card(
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              ),
              child: ListTile(
                visualDensity: VisualDensity(vertical: 3),
                leading: Container(
                  height: double.infinity,
                  child: SvgPicture.asset('assets/images/icons/image-gen.svg',
                      height: 30),
                ),
                title: Text("Product descriptions",
                    style: TextStyle(
                      fontSize: 13,
                    )),
                subtitle:
                    Text('Organize and manage you products within a catalog',
                        style: TextStyle(
                          fontSize: 12,
                        )),
                tileColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    ));
  }
}
