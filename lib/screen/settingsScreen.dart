import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/auth/auth_viewModel.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  SettingsScreenViewModel viewModel = SettingsScreenViewModel();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: viewModel.scaffoldKey,
        drawer: const DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            viewModel.scaffoldKey.currentState!.openDrawer();
          },
          child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        backgroundColor: const Color.fromARGB(246, 249, 245, 245),
        body: FutureBuilder(
          future: viewModel.showUserData(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Material(
                          borderRadius: BorderRadius.circular(10),
                          elevation: 1,
                          child: Container(
                            margin: const EdgeInsets.all(20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text('Personal Info'),
                                const Text('Update your personal details',
                                    style: TextStyle(color: Colors.grey)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Text("Prefferred Name",
                                    style: TextStyle(color: Colors.grey)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(viewModel
                                    .showAuthModel.data!.user!.firstName!),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Text("Last Name",
                                    style: TextStyle(color: Colors.grey)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(viewModel
                                    .showAuthModel.data!.user!.lastName!),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Text("Email",
                                    style: TextStyle(color: Colors.grey)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    viewModel.showAuthModel.data!.user!.email!),
                                const Text(
                                    'We currently do not support changing email address',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 13)),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Divider(),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.02,
                                ),
                                const Text("Input Language",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.270,
                                            child: CupertinoPicker(
                                              backgroundColor: Colors.white,
                                              itemExtent: 32,
                                              onSelectedItemChanged:
                                                  (int index) {
                                                Provider.of<SettingsScreenViewModel>(
                                                        context,
                                                        listen: false)
                                                    .updateSelectInputLanguage(
                                                        viewModel.inputList.keys
                                                            .toList()[index]);
                                              },
                                              children: viewModel
                                                  .outPoutList.keys
                                                  .map((String item) {
                                                return Center(
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        Provider.of<SettingsScreenViewModel>(
                                                context)
                                            .selectInput,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'The original language you type into the app.',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                const Text("Output Language",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.grey),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      showCupertinoModalPopup<void>(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.270,
                                            child: CupertinoPicker(
                                              backgroundColor: Colors.white,
                                              itemExtent:
                                                  32, // Height of each item in the picker
                                              onSelectedItemChanged:
                                                  (int index) {
                                                Provider.of<SettingsScreenViewModel>(
                                                        context,
                                                        listen: false)
                                                    .updateSelectOutpoutLanguage(
                                                        viewModel
                                                            .outPoutList.keys
                                                            .toList()[index]);
                                              },
                                              children: viewModel
                                                  .outPoutList.keys
                                                  .map((String item) {
                                                return Center(
                                                  child: Text(item),
                                                );
                                              }).toList(),
                                            ),
                                          );
                                        },
                                      );
                                    },
                                    child: Center(
                                      child: Text(
                                        Provider.of<SettingsScreenViewModel>(
                                                context)
                                            .selectOutpout,
                                        style: const TextStyle(fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                                const Text(
                                  'The language you want your content  to be generated in',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 13),
                                ),
                                SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      ElevatedButton(
                                          style: const ButtonStyle(
                                              side: MaterialStatePropertyAll(
                                                BorderSide(
                                                    color: Colors.redAccent,
                                                    width: 1),
                                              ),
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Colors.white)),
                                          onPressed: () {
                                            Provider.of<AuthViewModel>(context,
                                                    listen: false)
                                                .logout(context);
                                          },
                                          child: const Text(
                                            "Logout",
                                            style: TextStyle(
                                                color: Colors.redAccent),
                                          )),
                                      SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.02),
                                      ElevatedButton(
                                          style: const ButtonStyle(
                                              backgroundColor:
                                                  MaterialStatePropertyAll(
                                                      Color.fromARGB(
                                                          255, 48, 98, 212))),
                                          onPressed: () async {
                                            await viewModel.saveChanges();
                                          },
                                          child: const Text(
                                            "Save Changes",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ))
                                    ])
                              ],
                            ),
                          ),
                        ),
                      ]),
                ),
              );
            } else {
              return const Text("error");
            }
          },
        ));
  }
}
