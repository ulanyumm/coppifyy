import 'package:flutter/cupertino.dart';
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
        child: Container(
          height: 1000,
          width: double.infinity,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: 30,
                ),
                Center(
                  child: SvgPicture.asset('assets/images/icons/premiumKeys.svg',
                      height: 250),
                ),
                Text(
                    'With our simple API, seamlessly import product information and export product descriptions for your PDP.',
                    style: TextStyle(
                      fontSize: 23,
                    )),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/seamlessIntegration.svg',
                    height: 35),
                SizedBox(
                  height: 5,
                ),
                Text('Seamless Integration',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'A simple REST API that allows you to integrate quickly and easily. Detailed documentation and hands-on support will make connecting with our platform a breeze.',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/empireCatalogs.svg',
                    height: 35),
                SizedBox(
                  height: 5,
                ),
                Text('Import entire catalogs',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Make use of bulk operations and send all your product information over at once. We retain your original formatting to maximize your time saved.',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                SvgPicture.asset('assets/images/icons/customizableOptions.svg',
                    height: 35),
                SizedBox(
                  height: 5,
                ),
                Text('Customizable options',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Take fine-grained control of your product data and the kind of tone, style and structure of the product descriptions you want generated..',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(children: [
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                            elevation: MaterialStatePropertyAll(0),
                            side: MaterialStatePropertyAll(
                              BorderSide(color: Colors.grey),
                            ),
                            backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 255, 255, 255),
                            )),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          'View docs',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  SizedBox(width: 10),
                  Container(
                    width: 110,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            shape:
                                MaterialStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            )),
                            backgroundColor: MaterialStatePropertyAll(
                              Colors.indigo,
                            )),
                        onPressed: () {},
                        child: Text(
                          'Contact us',
                        )),
                  )
                ]),
                SizedBox(
                  height: 30,
                ),
              ]),
        ),
      ),
    ));
  }
}
