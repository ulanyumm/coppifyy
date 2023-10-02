import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articlegenerator.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';

import 'package:hypotenuse/widgets/plansAndPricing/plansAndPricing.dart';
import 'package:hypotenuse/screen/settingsScreen.dart';
import 'package:hypotenuse/screen/templateLibraryScreen.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({
    super.key,
  });

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  SettingsScreenViewModel viewModel = SettingsScreenViewModel();
  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: viewModel.showUserData(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.connectionState == ConnectionState.done) {
          return Drawer(
              width: MediaQuery.of(context).size.width * 0.6,
              child: ListView(
                  padding: const EdgeInsets.only(top: 40),
                  children: <Widget>[
                    SvgPicture.asset("assets/images/icons/logo.svg",
                        height: MediaQuery.of(context).size.height * 0.07),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child:
                              SvgPicture.asset("assets/images/icons/home.svg"),
                        ),
                        title: const Text("Home"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DashboardScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: double.infinity,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              "assets/images/icons/templates.svg"),
                        ),
                        title: const Text("Templates"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const TemplateLibraryScreen(),
                              ));
                        },
                      ),
                    ),
                    /*  SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset("assets/images/icons/documents.svg"),
                backgroundColor: Colors.transparent,
              ),
              title: Text("Documents"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DocumentsScreen()));
              },
            ),
          ),
          Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
            child: ListTile(
              leading: CircleAvatar(
                child: SvgPicture.asset("assets/images/icons/blogArticle.svg"),
                backgroundColor: Colors.transparent,
              ),
              title: Text("Blog Article"),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BlogArticlePost()));
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.07,
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
            height: MediaQuery.of(context).size.height * 0.07,
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
          ),*/
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              "assets/images/icons/articleGenerator.svg"),
                        ),
                        title: const Text("Article Generator"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ArticleGenerator()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.transparent,
                            child: SvgPicture.asset(
                                "assets/images/icons/money.svg"),
                          ),
                          title: Text(viewModel
                              .showAuthModel.data!.user!.credit!
                              .toString()),
                          onTap: () {}),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              "assets/images/icons/plansPricing.svg"),
                        ),
                        title: const Text("Plans & Pricing"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const PlansAndPricingScreen()));
                        },
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.07,
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: SvgPicture.asset(
                              "assets/images/icons/settings.svg"),
                        ),
                        title: const Text("Settings"),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SettingsScreen()));
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ]));
        } else {
          return const Text('Error');
        }
      });
}
