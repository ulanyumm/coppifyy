import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/auth/forgotPassword.dart';
import 'package:hypotenuse/screen/auth/SignUp/signUpScreen.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart'; // Ekledik
import 'package:hypotenuse/screen/auth/Login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  void initState() {
    // Bu kısmı sildik, artık view model bu işi yapıyor.
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LoginViewModel>(context);

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        key: viewModel.scaffoldKey,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    height: height * 0.1,
                  ),
                  SvgPicture.asset('assets/images/icons/logo.svg',
                      height: height * 0.09, width: width * 0.2),
                  SizedBox(
                    height: height * 0.06,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      'Log in to continue.',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: viewModel.mailController,
                          decoration: const InputDecoration(
                            isDense: true,
                            border: OutlineInputBorder(),
                            labelStyle: TextStyle(
                              fontSize: 13,
                            ),
                            labelText: 'Email',
                          ),
                          validator: viewModel.validateEmail,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: viewModel.passwordController,
                          obscureText: viewModel.hidePassword,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.02,
                            ),
                            isDense: true,
                            suffixIcon: IconButton(
                              icon: viewModel.hidePassword
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),
                              onPressed: () {
                                viewModel.hidePasswordFunc();
                              },
                            ),
                            border: const OutlineInputBorder(),
                            labelStyle: const TextStyle(
                              fontSize: 13,
                            ),
                            labelText: 'Password',
                          ),
                          validator: viewModel.lengthPassword,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Transform.translate(
                              offset: const Offset(-14, 0),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: viewModel.rememberMe,
                                    onChanged: (newValue) {
                                      viewModel.toggleRememberMe();
                                    },
                                  ),
                                  const Text("Remember me"),
                                ],
                              ),
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ));
                                },
                                child: const Text(
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
                                    UIHelper.activeButtonColor()),
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ))),
                            onPressed: () async {
                              if (viewModel.formKey.currentState!.validate()) {
                                bool isLoggedIn = await viewModel.loginAuth(
                                  viewModel.mailController.text,
                                  viewModel.passwordController.text,
                                );
                                if (isLoggedIn) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const DashboardScreen(),
                                    ),
                                  );
                                }
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
                          padding: const EdgeInsets.only(left: 20),
                          child: Row(
                            children: [
                              const Text("Don't have an account?"),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignUpScreen(),
                                      ));
                                },
                                child: const Text('Sign Up'),
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
        ));
  }
}
