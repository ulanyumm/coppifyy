import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/auth/SignUp/signUpScreen.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';
import 'package:hypotenuse/screen/auth/Login/login_viewmodel.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    var model = Provider.of<LoginViewModel>(context);
    return FutureBuilder(
      future: model.canLogIn(context),
      builder: (BuildContext context, AsyncSnapshot<bool?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(body: Center(child: CircularProgressIndicator()));
        } else if (snapshot.connectionState == ConnectionState.done) {
          return snapshot.data == true ? const DashboardScreen() : const SignUpScreen();
        } else {
          return const SignUpScreen();
        }
      },
    );
  }
}
