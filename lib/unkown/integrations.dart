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
      backgroundColor: const Color.fromARGB(246, 249, 245, 245),
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Integrations',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Connect to third-party applications.'),
            const SizedBox(
              height: 20,
            ),
            const Divider(),
            const SizedBox(
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
                      const Text('API Keys',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold)),
                      const Text(
                          'Seamlessly import product information an export product descriptions for your PDP'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                elevation: const MaterialStatePropertyAll(0),
                                side: const MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
                                  Color.fromARGB(255, 255, 255, 255),
                                )),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const ApiKeysScreen(),
                                  ));
                            },
                            child: const Text('Get API Keys',
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))),
                      ),
                    ]),
              ),
            ),
            const SizedBox(
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
                          const Text('Wordpress',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          const SizedBox(
                            width: 15,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: const Color.fromARGB(255, 225, 229, 245),
                            ),
                            height: 20,
                            width: 60,
                            child: const Center(
                              child: Text(
                                'BETA',
                                style: TextStyle(
                                    fontSize: 12,
                                    color:
                                        Color.fromARGB(255, 40, 49, 101)),
                              ),
                            ),
                          )
                        ],
                      ),
                      const Text(
                          'Connect your sites to directly publish generated blog articles'),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                )),
                                elevation: const MaterialStatePropertyAll(0),
                                side: const MaterialStatePropertyAll(
                                  BorderSide(color: Colors.grey),
                                ),
                                backgroundColor: const MaterialStatePropertyAll(
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
                                          const Text('Connect Wordpress sites',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: const Color.fromARGB(
                                                  255, 225, 229, 245),
                                            ),
                                            height: 20,
                                            width: 40,
                                            child: const Center(
                                              child: Text(
                                                'BETA',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Color.fromARGB(
                                                        255, 40, 49, 101)),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Create a new application password with your WordPress administrator role account',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Text(
                                        'Paste your generated password here to enable publishing post to your Wordpress sites.',
                                        style: TextStyle(
                                          fontSize: 13,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Form(
                                        key: _formKey,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            const Text(
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
                                                      borderSide: const BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      const TextStyle(fontSize: 12),
                                                  labelText:
                                                      'Enter your Wordpress site name',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text(
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
                                                      borderSide: const BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      const TextStyle(fontSize: 12),
                                                  labelText:
                                                      'https://domain.com',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.02,
                                            ),
                                            const Text(
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
                                                      borderSide: const BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      const TextStyle(fontSize: 12),
                                                  labelText:
                                                      'Enter your Wordpress username',
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: height * 0.03,
                                            ),
                                            const Text(
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
                                                      borderSide: const BorderSide(
                                                          width: 0.4),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8)),
                                                  labelStyle:
                                                      const TextStyle(fontSize: 12),
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
                                                  SizedBox(
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
                                                                const MaterialStatePropertyAll(
                                                                    0),
                                                            side:
                                                                const MaterialStatePropertyAll(
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey),
                                                            ),
                                                            backgroundColor:
                                                                const MaterialStatePropertyAll(
                                                              Color.fromARGB(
                                                                  255,
                                                                  255,
                                                                  255,
                                                                  255),
                                                            )),
                                                        onPressed: () =>
                                                            Navigator.pop(
                                                                context),
                                                        child: const Text(
                                                          'Cancel',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        )),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
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
                                                                const MaterialStatePropertyAll(
                                                              Colors.indigo,
                                                            )),
                                                        onPressed: () {},
                                                        child: const Text('Connect')),
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
                            child: const Text('Connect',
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
