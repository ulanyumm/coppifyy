import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/dropDownButton.dart';
import 'package:hypotenuse/widgets/inputLanguageDropDown.dart';
import 'package:hypotenuse/widgets/outputLanguageDropDown.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
    return Scaffold(
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
        backgroundColor: Color.fromARGB(246, 249, 245, 245),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Account',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              Text('Personal Info'),
              Text('Update your personal details',
                  style: TextStyle(color: Colors.grey)),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 1,
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Prefferred Name"),
                      SizedBox(
                        height: height * 0.05,
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        )),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("Email"),
                      SizedBox(
                        height: height * 0.05,
                        child: TextField(
                            decoration: InputDecoration(
                          border: OutlineInputBorder(),
                        )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(),
                      Row(children: [
                        SizedBox(width: width * 0.35),
                        /* ElevatedButton(
                            style: ButtonStyle(
                                side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey, width: 1),
                                ),
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.white)),
                            onPressed: null,
                            child: Text("Cancel")), */
                        SizedBox(width: 80),
                        ElevatedButton(onPressed: null, child: Text("Save")),
                      ]),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Divider(),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Language Settings'),
                      Text('Chose your content input and output language',
                          style: TextStyle(color: Colors.grey)),
                      SizedBox(
                        height: 20,
                      ),
                      Material(
                        borderRadius: BorderRadius.circular(10),
                        elevation: 1,
                        child: Container(
                          margin: EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Input Language"),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                SizedBox(
                                    height: height * 0.05,
                                    child: InputDropdownButtons()),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                Text(
                                  'The original language you type into the app.',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(height: 10),
                                Text("Output Language"),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                SizedBox(
                                    height: height * 0.05,
                                    child: OutputDropdownButtons()),
                                SizedBox(
                                  height: height * 0.009,
                                ),
                                Text(
                                  'The language you want your content  to be generated in',
                                  style: TextStyle(fontSize: 13),
                                ),
                                Divider(),
                                Row(children: [
                                  SizedBox(width: width * 0.35),
                                  /* ElevatedButton(
                                      style: ButtonStyle(
                                          side: MaterialStatePropertyAll(
                                            BorderSide(
                                                color: Colors.grey, width: 1),
                                          ),
                                          backgroundColor:
                                              MaterialStatePropertyAll(
                                                  Colors.white)),
                                      onPressed: null,
                                      child: Text("Cancel")), */
                                  SizedBox(width: 80),
                                  ElevatedButton(
                                      onPressed: null, child: Text("Save"))
                                ])
                              ]),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStatePropertyAll(0),
                      backgroundColor: MaterialStatePropertyAll(Colors.white),
                      side: MaterialStatePropertyAll(
                        BorderSide(color: Colors.red),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Logout", style: TextStyle(color: Colors.red))),
              ),
            ]),
          ),
        ));
  }
}
