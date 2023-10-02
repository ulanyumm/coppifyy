import 'package:flutter/material.dart';
import 'package:hypotenuse/unkown/startscreen22.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/dropDownButton.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
    double height = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Scaffold(
            key: scaffoldKey,
            drawer: const DrawerMenu(),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color.fromARGB(255, 76, 97, 220),
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: const Icon(Icons.menu),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.startFloat,
            body: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                SizedBox(
                  height: height * 0.1,
                ),
                const Text('Welcome to Copify AI',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: height * 0.02,
                ),
                const Text(
                  'To start, tell us a bit about you.',
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                TextFormField(
                    decoration: InputDecoration(
                  labelText: 'Your name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )),
                SizedBox(
                  height: height * 0.02,
                ),
                TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Company name',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                SizedBox(
                  height: height * 0.02,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 130),
                  child: Text(
                    'What kind of work do you do?',
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const DropdownButtons(),
                SizedBox(
                  height: height * 0.1,
                ),
                SizedBox(
                  width: double.infinity,
                  height: height * 0.06,
                  child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            const Color.fromARGB(255, 76, 97, 220)),
                        elevation: MaterialStateProperty.all(0),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ))),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const StartScreen22()),
                      );
                    },
                    child: Text(
                      'Continue',
                      style: TextStyle(fontSize: height * 0.025),
                    ),
                  ),
                ),
              ]),
            )),
      ],
    );
  }
}
