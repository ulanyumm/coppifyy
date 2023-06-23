import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/signUpScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                  Colors.deepPurpleAccent,
                  Colors.deepPurple,
                  Colors.pinkAccent
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Text(
                      'Let AI write your content in seconds. Without writer’s block.',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.05)),
                ),
                Text(
                    'Provide a few keywords, and we’ll instantly turn them into full-length articles and marketing content, using our world-class AI with a vast knowledge of the world'),
                Column(
                  children: [
                    Container(
                      height: height * 0.07,
                      width: width * 0.9,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpScreen()),
                              );
                            },
                            child: Text(
                              'Try writing for free',
                              style: TextStyle(fontSize: height * 0.02),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.deepPurpleAccent)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '7-day trial. No credit card required',
                      style: TextStyle(
                          color: Colors.grey, fontSize: height * 0.02),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
