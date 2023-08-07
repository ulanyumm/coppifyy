import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/plansTabBar.dart';

class PlansAndPricingScreen extends StatefulWidget {
  const PlansAndPricingScreen({super.key});

  @override
  State<PlansAndPricingScreen> createState() => _PlansAndPricingScreenState();
}

class _PlansAndPricingScreenState extends State<PlansAndPricingScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: RichText(
              text: TextSpan(children: [
            TextSpan(
                text: 'Plans and pricing   ',
                style: TextStyle(fontSize: 30, color: Colors.black)),
            TextSpan(
                text: 'Start small and scale up as you need.',
                style: TextStyle(color: Colors.grey)),
          ])),
          // bottom: Expanded(child: Container(child: PlansTabBar())),
        ),
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Expanded(child: Container(child: PlansTabBar()))]),
      ),
    );
  }
}
