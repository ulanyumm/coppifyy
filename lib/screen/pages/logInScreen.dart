import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/pages/signUpScreen.dart';
import 'package:hypotenuse/viewmodel/login_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginViewModel viewModel = LoginViewModel();

  String? _validateEmail(value) {
    if (value!.isEmpty) {
      return 'Please enter some text';
    }
    RegExp emailRegExp = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (!emailRegExp.hasMatch(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _lengthPassword(value) {
    if (value!.isEmpty) {
      return 'Şifre Alanı Boş Kalamaz';
    }
    if (value.length < 8) {
      return 'Şifre En Az 8 Karakter Olmalı';
    }
    return null;
  }

  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    _mailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          drawer: DrawerMenu(),
          floatingActionButton: FloatingActionButton(
            child:
                SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              scaffoldKey.currentState!.openDrawer();
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: height * 0.1,
                    ),
                    SvgPicture.asset('assets/images/icons/logo.svg',
                        height: height * 0.09, width: width * 0.2),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Center(
                        child: Text('Log In',
                            style: TextStyle(
                                fontSize: height * 0.04,
                                fontWeight: FontWeight.bold))),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Log in to continue.',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.06,
                            child: TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              controller: _mailController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                ),
                                labelText: 'Email',
                              ),
                              validator: _validateEmail,
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          SizedBox(
                            height: height * 0.06,
                            child: TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              controller: _passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelStyle: TextStyle(
                                  fontSize: 13,
                                ),
                                labelText: 'Password',
                              ),
                              validator: _lengthPassword,
                            ),
                          ),
                          Row(
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Forgot password?',
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.003,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: height * 0.06,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF3162D5)),
                                  elevation: MaterialStateProperty.all(0),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ))),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  viewModel.loginAuth(
                                      context,
                                      _mailController.text,
                                      _passwordController.text,
                                      "asd");
                                }
                              },
                              child: Text(
                                'Continue',
                                style: UIHelper.getButtonTextStyle(),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Row(
                              children: [
                                Text("Don't have an account?"),
                                TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              const SignUpScreen(),
                                        ));
                                  },
                                  child: Text('Sign Up'),
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: width * 0.05,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    )
                  ]),
            ),
          )),
    );
  }
}
