import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferAUserScreen extends StatefulWidget {
  const ReferAUserScreen({super.key});

  @override
  State<ReferAUserScreen> createState() => _ReferAUserScreenState();
}

class _ReferAUserScreenState extends State<ReferAUserScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(246, 249, 245, 245),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'Earn free credits',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                      'Get free credits for referring a friend or sharing your generated content on social media',
                      style: TextStyle(color: Colors.grey)),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(children: [
                              const Text("Give 50 Credits, get 50 \ncredits",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
                                width: 20,
                              ),
                              Container(
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color.fromARGB(255, 183, 239, 216),
                                ),
                                child: const Center(
                                  child: Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Text(
                                      '+50 credits',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color:
                                              Color.fromARGB(255, 14, 159, 55)),
                                    ),
                                  ),
                                ),
                              )
                            ]),
                            const SizedBox(
                              height: 10,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                const TextSpan(
                                    text:
                                        "Invite your friends to Hypotenuse AI, and we'll give you both 50 bonus credits when they subscribe to a paid plan.",
                                    style: TextStyle(color: Colors.grey)),
                                TextSpan(
                                  text: "Terms and Conditions",
                                  style: const TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      launchUrl(Uri.https(
                                          'https://app.hypotenuse.ai/referral-terms'));
                                    },
                                )
                              ]),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              "Share this link:",
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                      "https://app.hypotenuse.ai/invite?ref=39335F9F"),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    margin: const EdgeInsets.all(10),
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: const Color.fromARGB(255, 76, 97, 220),
                                    ),
                                    child: const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.copy, color: Colors.white),
                                          Text(
                                            "Copy Link",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                ]),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Center(
                              child: SvgPicture.asset(
                                "assets/images/icons/refer-a-user.svg",
                                height: 100,
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Pending credits',
                                              style: TextStyle(fontSize: 13)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('0',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                  )),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60, right: 60),
                              child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Total credits earned',
                                              style: TextStyle(fontSize: 13)),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text('0',
                                              style: TextStyle(fontSize: 20)),
                                        ]),
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ]),
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
