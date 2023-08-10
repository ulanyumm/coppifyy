import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/unkown/edit_tab.dart';
import 'package:hypotenuse/screen/pages/logInScreen.dart';
import 'package:hypotenuse/viewmodel/register_viewmodel.dart';
import 'package:hypotenuse/widgets/stepper/blog_step1.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterViewModel viewModel = RegisterViewModel();

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

  TextEditingController _nameController = TextEditingController();
  TextEditingController _mailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
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
                  height: height * 0.07,
                ),
                Center(
                    child: Text('Sign Up',
                        style: TextStyle(
                            fontSize: height * 0.04,
                            fontWeight: FontWeight.bold))),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Harness the power of AI to easily create compelling content.',
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
                          textAlignVertical: TextAlignVertical.top,
                          //unfocus işlemi
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: _nameController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            alignLabelWithHint: false,
                            labelStyle: TextStyle(
                              fontSize: 13,
                            ),
                            labelText: 'Full Name',
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.06,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
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
                          textAlignVertical: TextAlignVertical.top,
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
                      SizedBox(
                        height: height * 0.02,
                      ),
                      SizedBox(
                        height: height * 0.06,
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.top,
                          controller: _confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              fontSize: 13,
                            ),
                            labelText: 'Password Repeat',
                          ),
                          validator: _lengthPassword,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: height * 0.06,
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xFF3162D5)),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ))),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              viewModel.registerAuth(
                                  context,
                                  _mailController.text,
                                  _passwordController.text,
                                  _confirmPasswordController.text,
                                  "Asd",
                                  _nameController.text);
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: UIHelper.getButtonTextStyle(),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      Row(
                        children: [
                          Text('Already have an account?'),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const LogInScreen()));
                            },
                            child: Text('Log in'),
                          ),
                          SizedBox(
                            height: 60,
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const EditorTabBar()),
                                );
                              },
                              child: Text('denemeler'))
                        ],
                      ),
                      SizedBox(
                        height: height * 0.03,
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
