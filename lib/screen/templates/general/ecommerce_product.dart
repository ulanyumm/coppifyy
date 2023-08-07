import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class EcommerceProduct extends StatefulWidget {
  const EcommerceProduct({super.key});

  @override
  State<EcommerceProduct> createState() => _EcommerceProductState();
}

class _EcommerceProductState extends State<EcommerceProduct> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _topicController2 = TextEditingController();
  TextEditingController _topicController3 = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey _key = GlobalKey();
  bool selectedRewrite = false;
  bool selectedMoreOptions = false;
  int selectedButtonIndex = -1;
  bool isChecked = false;
  List<String> listTone = [
    "Conversational",
    "Enthusiatic",
    "Professional",
    "Humorous"
  ];
  String selectTone = "Conversational";
  bool selectedDrafts = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: _scaffoldKey,
          drawer: DrawerMenu(),
          floatingActionButton: FloatingActionButton(
            child:
                SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Ecommerce Product Description',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Write a unique, creative, and strategic description that's designed to increase sales.",
                          style: UIHelper.getIcerikTextStyle(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text(
                          'Product name *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: _key,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                maxLength: 1000,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _topicController,
                                autofocus: false,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  labelStyle: TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                'Product Description *',
                                style: UIHelper.getBaslikTextStyle(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _topicController2,
                                autofocus: false,
                                minLines: 6,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  labelStyle: TextStyle(fontSize: 13),
                                  hintText:
                                      'Explain here to the AI what your product (or service) is about. Rewrite to get different results.',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text('Tone *',
                                  style: UIHelper.getBaslikTextStyle()),
                              SizedBox(height: 5),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: DropdownButton(
                                  focusColor: Colors.grey,
                                  elevation: 0,
                                  underline: Container(),
                                  isExpanded: true,
                                  value: selectTone,
                                  onChanged: (value) {
                                    setState(() {
                                      selectTone = value!.toString();
                                    });
                                  },
                                  items: listTone.map((itemone) {
                                    return DropdownMenuItem(
                                        value: itemone,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 20.0),
                                          child: Text(itemone),
                                        ));
                                  }).toList(),
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedDrafts = !selectedDrafts;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Text('More options', style: TextStyle()),
                                    IconButton(
                                      onPressed: () {},
                                      icon: selectedDrafts
                                          ? Icon(Icons.keyboard_arrow_down)
                                          : Icon(Icons.keyboard_arrow_up),
                                    ),
                                  ],
                                ),
                              ),
                              AnimatedContainer(
                                color: Colors.white,
                                width: double.infinity,
                                height: selectedDrafts
                                    ? MediaQuery.of(context).size.height * 0.12
                                    : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Target Audience',
                                        style: UIHelper.getBaslikTextStyle()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      onChanged: (value) {
                                        setState(() {});
                                      },
                                      controller: _topicController3,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        filled: true,
                                        fillColor: Color.fromARGB(
                                          255,
                                          255,
                                          255,
                                          255,
                                        ),
                                        labelStyle: TextStyle(fontSize: 13),
                                        hintText: 'blog writers and marketers',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: _topicController
                                              .text.isEmpty
                                          ? Color.fromARGB(255, 76, 97, 220)
                                          : Color.fromARGB(255, 76, 97, 220),
                                    ),
                                    onPressed: _topicController.text.isEmpty ||
                                            _topicController2.text.isEmpty
                                        ? null
                                        : () {},
                                    child: Text('Generate',
                                        style: UIHelper.getButtonTextStyle())),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height / 2,
                            child: Center(
                              child: Column(children: [
                                SizedBox(
                                  height: 60,
                                ),
                                SvgPicture.asset(
                                    'assets/images/icons/drafts.svg',
                                    height: 120),
                                Text('No content yet',
                                    style: UIHelper.getAnaBaslikTextStyle()),
                                Text(
                                  'Describe your topic to our AI \n to start writing some \n compelling copy',
                                  textAlign: TextAlign.center,
                                  style: UIHelper.getIcerikTextStyle(),
                                ),
                                SizedBox(
                                  height: 50,
                                )
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                        ])
                  ])))),
    );
  }
}
