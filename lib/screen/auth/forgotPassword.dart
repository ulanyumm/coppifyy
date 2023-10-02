import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/auth/SignUp/signUpScreen.dart';
import 'package:hypotenuse/viewmodel/forgotPassword_viewModel.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ForgotPasswordViewModel>(context);
    return Scaffold(
        body: Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot your password?',
                style: UIHelper.getAnaBaslikTextStyle()),
            Row(
              children: [
                const Text('Not a member?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUpScreen(),
                          ));
                    },
                    child: const Text('Get Started'))
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            const Text('Email'),
            const SizedBox(height: 5),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: TextField(
                  onChanged: (value) {
                    viewModel.isActivebuttonFunc(value);
                  },
                  controller: viewModel.emailController,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    filled: true,
                    fillColor: UIHelper.fillColor(),
                    isDense: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  )),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Selector<ForgotPasswordViewModel, bool>(
              builder: (context, isActiveButton, child) {
                return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: UIHelper.activeButtonColor(),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: isActiveButton
                          ? () {
                              viewModel.postTransiction(
                                  email: viewModel.emailController.text);
                            }
                          : null,
                      child: Selector<ForgotPasswordViewModel, bool>(
                        builder: (context, isLoading, child) {
                          return isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Send Mail',
                                  style: UIHelper.getButtonTextStyle(),
                                );
                        },
                        selector: (context, state) => state.isLoading,
                      ),
                    ));
              },
              selector: (context, state) => state.isActiveButton,
            ),
          ],
        ),
      ),
    ));
  }
}
