import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/dashboardScreen.dart';

class StartScreen22 extends StatefulWidget {
  const StartScreen22({super.key});
  @override
  State<StartScreen22> createState() => _StartScreen22State();
}

class _StartScreen22State extends State<StartScreen22> {
  int selectedContainerIndex = -1;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'What would you like to do \n first?',
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "We'll help you get started faster.",
                style: TextStyle(fontSize: 17),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 0;
                      isChecked = true;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedContainerIndex == 0
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/blog-articles.svg",
                                height: 100,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Blog articles',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Go from idea to published in a \n streamlined workflow.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 1;
                      isChecked = true;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                            height: 150,
                            width: 330,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: selectedContainerIndex == 1
                                    ? Colors.green
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    "assets/images/icons/product-descriptions.svg",
                                    height: 90,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Product descriptions',
                                        style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Batch generate SEO friendly \n product descriptions',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ])),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 2;
                      isChecked = true;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedContainerIndex == 2
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/hypo-chat.svg",
                                height: 100,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hypo chat',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Easily create content by just \n chatting with AI.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 3;
                      isChecked = true;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedContainerIndex == 3
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/image-generation.svg",
                                height: 100,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Hypo art',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Generate stunning images, \n Express ideas. Stand out.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      selectedContainerIndex = 4;
                      isChecked = true;
                    });
                  },
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          height: 150,
                          width: 330,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: selectedContainerIndex == 4
                                  ? Colors.green
                                  : Colors.transparent,
                              width: 2,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/images/icons/ads-descriptions.svg",
                                height: 100,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Speech to text',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Convert speech to text with \n high accuracy and speed.',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 35,
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: isChecked == false
                          ? MaterialStateProperty.all(
                              Color.fromARGB(255, 187, 187, 191))
                          : MaterialStateProperty.all(
                              Color.fromARGB(255, 104, 113, 213)),
                      elevation: MaterialStateProperty.all(0),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ))),
                  onPressed: (isChecked == true)
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DashboardScreen()),
                          );
                        }
                      : null,
                  child: Text(
                    'Continue',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
