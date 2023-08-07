import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/widgets/frequentlyAskedQuestions.dart';

class PlansTabBar extends StatefulWidget {
  @override
  _PlansTabBarState createState() => _PlansTabBarState();
}

class _PlansTabBarState extends State<PlansTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool selectedDrafts = false;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          // give the tab bar a height [can change hheight to preferred height]
          Container(
            width: 270,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(
                12.0,
              ),
            ),
            child: TabBar(
              isScrollable: true,
              padding: EdgeInsets.all(7),
              controller: _tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: Colors.white,
              ),
              tabs: [
                // first tab [you can add an icon using the icon property]
                Tab(
                  child: Container(
                      height: 30,
                      child: Center(
                        child: Text(
                          'Monthly',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ),

                // second tab [you can add an icon using the icon property]
                Tab(
                  child: Container(
                      height: 30,
                      child: Row(
                        children: [
                          Text(
                            'Annual ',
                            style: TextStyle(color: Colors.black),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 154, 240, 167),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Text(
                                'Save 17%',
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color.fromARGB(255, 14, 159, 55)),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
          // tab bar view here
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                // first tab bar view widget
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20),
                            child: Container(
                                width: double.infinity,
                                height: 550,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/icons/basic.svg',
                                                  height: 30),
                                              SizedBox(
                                                width: 15,
                                              ),
                                              Text(
                                                'Basic',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ]),
                                        Divider(
                                          thickness: 2,
                                        ),
                                        Text(
                                            "Get started quickly and see if it meets your needs."),
                                        RichText(
                                          text: TextSpan(
                                              text: '\$9',
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 23),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: ' /month',
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 18),
                                                )
                                              ]),
                                        ),
                                        Text('Standart',
                                            style: TextStyle(fontSize: 18)),
                                        Text.rich(TextSpan(children: [
                                          TextSpan(
                                            text: '50',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 18),
                                          ),
                                          TextSpan(
                                            text: '  credits/month ',
                                          ),
                                          WidgetSpan(
                                            //overlay yapılacak
                                            child: Tooltip(
                                              child: Icon(
                                                Icons.help_outline,
                                                size: 18,
                                                color: Colors.grey,
                                              ),
                                              message:
                                                  'Credits let you generaten various content types, which cost different credit amounts.',
                                            ),
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text:
                                                '     Start-to-finish article writing wizard',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text:
                                                '     Limited access to HypoChat',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                              text:
                                                  '     200 watermark-free AI images (50 generates)')
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text:
                                                '     Upgraded 1024px image resolution',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text: '     Bulk workflows',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text: '     25+ languages',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text: '     Standard support',
                                          )
                                        ])),
                                        Text.rich(TextSpan(children: [
                                          WidgetSpan(
                                              child: Icon(Icons.check,
                                                  color: Colors.indigo,
                                                  size: 20)),
                                          TextSpan(
                                            text: '     1 user',
                                          )
                                        ])),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        SizedBox(
                                          height: 30,
                                          width: double.infinity,
                                          child: ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Color.fromARGB(
                                                    255, 104, 113, 213),
                                              ),
                                              onPressed: () {},
                                              child: Text("Select")),
                                        ),
                                      ]),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/starter.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Starter',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                          "Access to AI article wizard, all copy templates + standard image resolution"),
                                      RichText(
                                        text: TextSpan(
                                            text: '\$29',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' /month',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),
                                      Text('Standart',
                                          style: TextStyle(fontSize: 18)),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: '100',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: '  credits/month ',
                                        ),
                                        WidgetSpan(
                                          //overlay yapılacak
                                          child: Tooltip(
                                            child: Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            message:
                                                'Credits let you generaten various content types, which cost different credit amounts.',
                                          ),
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Start-to-finish article writing wizard',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '      Access to HypoChat',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            text:
                                                '     200 watermark-free AI images (50 generates)')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Upgraded 1024px image resolution',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Bulk workflows',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     25+ languages',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Standard support',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     1 user',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 104, 113, 213),
                                            ),
                                            onPressed: () {},
                                            child: Text("Select")),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/growth.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Growth',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                          "Everything in Starter + unlimited high-resolution images and advanced article writing features."),
                                      RichText(
                                        text: TextSpan(
                                            text: '\$59',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' /month',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),

                                      //Kaydırma button gelecek

                                      Text('Standart',
                                          style: TextStyle(fontSize: 18)),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: '350',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: '  credits/month ',
                                        ),
                                        WidgetSpan(
                                          //overlay yapılacak
                                          child: Tooltip(
                                            child: Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            message:
                                                'Credits let you generaten various content types, which cost different credit amounts.',
                                          ),
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Everything in starter',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Increased access to HypoChat',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            text:
                                                '     Unlimited free AI images')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Upgraded 2048px image resolution',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     25 plagiarism checks',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Priority email and chat support',
                                        )
                                      ])),

                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Up to 5 user',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 104, 113, 213),
                                            ),
                                            onPressed: () {},
                                            child: Text("Select")),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Color.fromARGB(255, 16, 24, 40),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/enterprise.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Enterprise',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ]),
                                      Text(
                                        "For content teams looking for personalized, on-brand storytelling.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('Custom',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white)),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     Annual licence-based pricing, with overage buffers',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     Custom AI templates and models tailored to your brand voice',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            style:
                                                TextStyle(color: Colors.white),
                                            text:
                                                '     API access for importing and exporting products in bulk')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text: '     Personal account manager',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     For teams of more than 5 users',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Contact Sales",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text('Frequently asked questions',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ]),

                    ///*****dropdowncontainer yapılacak */
                  ),
                ),

                // second tab bar view widget
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/starter.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Starter',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                          "Access to AI article wizard, all copy templates + standard image resolution"),
                                      RichText(
                                        text: TextSpan(
                                            text: '\$24',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' /month',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),
                                      Text('Standart',
                                          style: TextStyle(fontSize: 18)),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: '100',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: '  credits/month ',
                                        ),
                                        WidgetSpan(
                                          //overlay yapılacak
                                          child: Tooltip(
                                            child: Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            message:
                                                'Credits let you generaten various content types, which cost different credit amounts.',
                                          ),
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Start-to-finish article writing wizard',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '      Access to HypoChat',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            text:
                                                '     200 watermark-free AI images (50 generates)')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Upgraded 1024px image resolution',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Bulk workflows',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     25+ languages',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Standard support',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     1 user',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 104, 113, 213),
                                            ),
                                            onPressed: () {},
                                            child: Text("Select")),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/growth.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Growth',
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ]),
                                      Divider(
                                        thickness: 2,
                                      ),
                                      Text(
                                          "Everything in Starter + unlimited high-resolution images and advanced article writing features."),
                                      RichText(
                                        text: TextSpan(
                                            text: '\$49',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 23),
                                            children: <TextSpan>[
                                              TextSpan(
                                                text: ' /month',
                                                style: TextStyle(
                                                    color: Colors.grey,
                                                    fontSize: 18),
                                              )
                                            ]),
                                      ),

                                      //Kaydırma button gelecek

                                      Text('Standart',
                                          style: TextStyle(fontSize: 18)),
                                      Text.rich(TextSpan(children: [
                                        TextSpan(
                                          text: '350',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18),
                                        ),
                                        TextSpan(
                                          text: '  credits/month ',
                                        ),
                                        WidgetSpan(
                                          //overlay yapılacak
                                          child: Tooltip(
                                            child: Icon(
                                              Icons.help_outline,
                                              size: 18,
                                              color: Colors.grey,
                                            ),
                                            message:
                                                'Credits let you generaten various content types, which cost different credit amounts.',
                                          ),
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Everything in starter',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Increased access to HypoChat',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            text:
                                                '     Unlimited free AI images')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Upgraded 2048px image resolution',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     25 plagiarism checks',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text:
                                              '     Priority email and chat support',
                                        )
                                      ])),

                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          text: '     Up to 5 user',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 104, 113, 213),
                                            ),
                                            onPressed: () {},
                                            child: Text("Select")),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              width: double.infinity,
                              height: 550,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                color: Color.fromARGB(255, 16, 24, 40),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/icons/enterprise.svg',
                                                height: 30),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Text(
                                              'Enterprise',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            )
                                          ]),
                                      Text(
                                        "For content teams looking for personalized, on-brand storytelling.",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Text('Custom',
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white)),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     Annual licence-based pricing, with overage buffers',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     Custom AI templates and models tailored to your brand voice',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                            style:
                                                TextStyle(color: Colors.white),
                                            text:
                                                '     API access for importing and exporting products in bulk')
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text: '     Personal account manager',
                                        )
                                      ])),
                                      Text.rich(TextSpan(children: [
                                        WidgetSpan(
                                            child: Icon(Icons.check,
                                                color: Colors.indigo,
                                                size: 20)),
                                        TextSpan(
                                          style: TextStyle(color: Colors.white),
                                          text:
                                              '     For teams of more than 5 users',
                                        )
                                      ])),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              "Contact Sales",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            )),
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedDrafts = !selectedDrafts;
                              });
                            },
                            child: Row(
                              children: [
                                Text('What is a credit?', style: TextStyle()),
                                IconButton(
                                  onPressed: () {},
                                  icon: selectedDrafts
                                      ? Icon(Icons.keyboard_arrow_down)
                                      : Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                          ),
                          FrequentlyAskedQuestions(
                              selectedDrafts: selectedDrafts),
                          SizedBox(
                            height: 40,
                          ),
                        ]),

                    ///*****dropdowncontainer yapılacak */
                  ),
                ),
              ],
            ),
          )
        ]));
  }
}
