import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/auth/Login/logInScreen.dart';
import 'package:hypotenuse/viewmodel/register_viewmodel.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  RegisterViewModel viewModel = RegisterViewModel();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
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
              const Padding(
                padding: EdgeInsets.only(left: 20, right: 20),
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
                        controller: viewModel.nameController,
                        decoration: const InputDecoration(
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
                        controller: viewModel.mailController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            fontSize: 13,
                          ),
                          labelText: 'Email',
                        ),
                        validator: viewModel.validateEmail,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      height: height * 0.06,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: viewModel.passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            fontSize: 13,
                          ),
                          labelText: 'Password',
                        ),
                        validator: viewModel.lengthPassword,
                      ),
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    SizedBox(
                      height: height * 0.06,
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.top,
                        controller: viewModel.confirmPasswordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelStyle: TextStyle(
                            fontSize: 13,
                          ),
                          labelText: 'Password Repeat',
                        ),
                        validator: viewModel.lengthPassword,
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
                                MaterialStateProperty.all(const Color(0xFF3162D5)),
                            elevation: MaterialStateProperty.all(0),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ))),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            viewModel.registerAuth(
                                context,
                                viewModel.mailController.text,
                                viewModel.passwordController.text,
                                viewModel.confirmPasswordController.text,
                                "Asd",
                                viewModel.nameController.text);
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
                        const Text('Already have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()));
                          },
                          child: const Text('Log in'),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
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
    ));
  }
}
