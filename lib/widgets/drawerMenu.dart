import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';
import 'package:hypotenuse/screen/plansAndPricing.dart';
import 'package:hypotenuse/screen/profileScreen.dart';
import 'package:hypotenuse/screen/templateLibraryScreen.dart';
import 'package:hypotenuse/screen/templates/general/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/workflows/article_generator.dart';
import 'package:hypotenuse/screen/templates/workflows/copimage.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) => Drawer(
      width: 250,
      child: ListView(padding: EdgeInsets.only(top: 40), children: <Widget>[
        SvgPicture.asset("assets/images/icons/logo.svg", height: 40),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/home.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Home"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
          ),
        ),
        SizedBox(
          height: 45,
          width: double.infinity,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/templates.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Templates"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const TemplateLibraryScreen(),
                  ));
            },
          ),
        ),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/documents.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Documents"),
            onTap: () {},
          ),
        ),
        Divider(),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/blogArticle.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Blog Article"),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset(
                  "assets/images/icons/rewriteContentMenu.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Rewrite Content"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => RewriteContent()));
            },
          ),
        ),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/CopiMage.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("CopiMage"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CopiMageScreen()));
            },
          ),
        ),
        SizedBox(
          height: 45,
          child: ListTile(
            leading: CircleAvatar(
              child:
                  SvgPicture.asset("assets/images/icons/articleGenerator.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Article Generator"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ArticleGenerator()));
            },
          ),
        ),
        SizedBox(
          height: 280,
        ),
        SizedBox(
          height: 40,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/money.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("15 Credits"),
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 40,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/plansPricing.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Plans & Pricing"),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PlansAndPricingScreen()));
            },
          ),
        ),
        SizedBox(
          height: 40,
          child: ListTile(
            leading: CircleAvatar(
              child: SvgPicture.asset("assets/images/icons/settings.svg"),
              backgroundColor: Colors.transparent,
            ),
            title: Text("Settings"),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ProfileScreen()));
            },
          ),
        ),
        SizedBox(height: 10),
      ]));
}
