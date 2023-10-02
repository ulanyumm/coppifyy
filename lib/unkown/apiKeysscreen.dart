import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApiKeysScreen extends StatefulWidget {
  const ApiKeysScreen({super.key});

  @override
  State<ApiKeysScreen> createState() => _ApiKeysScreenState();
}

class _ApiKeysScreenState extends State<ApiKeysScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: SizedBox(
          height: 1000,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: SvgPicture.asset('assets/images/icons/premiumKeys.svg',
                      height: 250),
                ),
                const Text(
                    'With our simple API, seamlessly import product information and export product descriptions for your PDP.',
                    style: TextStyle(
                      fontSize: 23,
                    )),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/seamlessIntegration.svg',
                    height: 35),
                const SizedBox(
                  height: 5,
                ),
                const Text('Seamless Integration',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'A simple REST API that allows you to integrate quickly and easily. Detailed documentation and hands-on support will make connecting with our platform a breeze.',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/empireCatalogs.svg',
                    height: 35),
                const SizedBox(
                  height: 5,
                ),
                const Text('Import entire catalogs',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Make use of bulk operations and send all your product information over at once. We retain your original formatting to maximize your time saved.',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/customizableOptions.svg',
                    height: 35),
                const SizedBox(
                  height: 5,
                ),
                const Text('Customizable options',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 5,
                ),
                const Text(
                  'Take fine-grained control of your product data and the kind of tone, style and structure of the product descriptions you want generated..',
                  style: TextStyle(fontSize: 15),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(children: [
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                            elevation: const MaterialStatePropertyAll(0),
                            side: const MaterialStatePropertyAll(
                              BorderSide(color: Colors.grey),
                            ),
                            backgroundColor: const MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 255, 255),
                            )),
                        onPressed: () => Navigator.pop(context),
                        child: const Text(
                          'View docs',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                    width: 110,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                            backgroundColor: const MaterialStatePropertyAll(
                              Colors.indigo,
                            )),
                        onPressed: () {},
                        child: const Text(
                          'Contact us',
                        )),
                  )
                ]),
                const SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    ));
  }
}
