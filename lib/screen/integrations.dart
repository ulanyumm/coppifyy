import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/unkown/apiKeysscreen.dart';

class IntegrationsScreen extends StatefulWidget {
  const IntegrationsScreen({super.key});

  @override
  State<IntegrationsScreen> createState() => _IntegrationsScreenState();
}

class _IntegrationsScreenState extends State<IntegrationsScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color.fromARGB(246, 249, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'Integrations',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            Text('Connect to third-party applications.'),
            SizedBox(
              height: 20,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/images/icons/apiKeys.svg',
                          height: 35),
                      Text('API Keys',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      Text(
                          'Seamlessly import product information an export product descriptions for your PDP'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                elevation: MaterialStatePropertyAll(0),
                                side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ApiKeysScreen(),
                                  ));
                            },
                            child: Text('Get API Keys',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('assets/images/icons/wordpress.svg',
                          height: 35),
                      Row(
                        children: [
                          Text('Wordpress',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color.fromARGB(255, 225, 229, 245),
                            ),
                            height: 20,
                            width: 60,
                            child: Center(
                              child: Text(
                                'BETA',
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        const Color.fromARGB(255, 40, 49, 101)),
                              ),
                            ),
                          )
                        ],
                      ),
                      Text(
                          'Connect your sites to directly publish generated blog articles'),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                elevation: MaterialStatePropertyAll(0),
                                side: MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey),
                                ),
                                backgroundColor: MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255),
                                )),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  content: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      SvgPicture.asset(
                                          'assets/images/icons/wordpress.svg',
                                          height: 30),
                                      Row(
                                        children: [
                                          Text('Connect Wordpress sites',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                          SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: Color.fromARGB(
                                                  255, 225, 229, 245),
                                            ),
                                            height: 20,
                                            width: 40,
                                            child: Center(
                                              child: Text(
                                                'BETA',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: const Color.fromARGB(
                                                        255, 40, 49, 101)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Create a new application password with your WordPress administrator role account',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Paste your generated password here to enable publishing post to your Wordpress sites.',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Wordpress site name',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      TextStyle(fontSize: 12),
                                                  labelText:
                                                      'Enter your Wordpress site name',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              'Wordpress address',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      TextStyle(fontSize: 12),
                                                  labelText:
                                                      'https://domain.com',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            Text(
                                              'Wordpress username',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      TextStyle(fontSize: 12),
                                                  labelText:
                                                      'Enter your Wordpress username',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            Text(
                                              'Application password',
                                              style: TextStyle(
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.05,
                                              child: TextFormField(
                                                decoration: InputDecoration(
                                                  border: OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      TextStyle(fontSize: 12),
                                                  labelText:
                                                      'xGww v7dY jkGy zfz8 Xz8U KCaE',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: [
                                                  Container(
                                                    width: 110,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            )),
                                                            elevation:
                                                                MaterialStatePropertyAll(
                                                                    0),
                                                            side:
                                                                MaterialStatePropertyAll(
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                            )),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                  SizedBox(width: 10),
                                                  Container(
                                                    width: 110,
                                                    child: ElevatedButton(
                                                        style: ButtonStyle(
                                                            shape: MaterialStatePropertyAll(
                                                                RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            )),
                                                            backgroundColor:
                                                                MaterialStatePropertyAll(
                                                              Colors.indigo,
                                                            )),
                                                        onPressed: () {},
                                                        child: Text('Connect')),
                                                  )
                                                ])
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: Text('Connect',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))),
                      ),
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
