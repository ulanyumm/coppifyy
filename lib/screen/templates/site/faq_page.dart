import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _topicController2 = TextEditingController();
  TextEditingController _topicController3 = TextEditingController();
  TextEditingController _keywordsController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//Tone eklenmesi
  List<String> listTone = [
    "Conversational",
    "Enthusiatic",
    "Humorous",
    "Professional",
  ];
  String selectTone = "Conversational";

  bool selectedAnything = false;
  bool selectedDrafts = false;

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController();
    _topicController2 = TextEditingController();
    _topicController3 = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
    _topicController2.dispose();
    _topicController3.dispose();
    _keywordsController.dispose();
    super.dispose();
  }

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
                    Text("FAQ's", style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Generate frequently asked questions based on your product description.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Product name *',
                      style: UIHelper.getBaslikTextStyle(),
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: UIHelper.textfieldYukseklik(),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: _topicController,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                hintText: 'Netflix, Spotify, Uber',
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
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Product description *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _topicController2,
                            autofocus: false,
                            minLines: 5,
                            decoration: InputDecoration(
                              hintText:
                                  'Explain here to the AI what your product (or service) is about. Rewrite to get different results',
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
                            height: 10,
                          ),
                          Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                          SizedBox(height: 16),
                          Container(
                            height: UIHelper.textfieldYukseklik(),
                            width: double.infinity,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1, color: Colors.grey),
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
                            height: 20,
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
                                ? MediaQuery.of(context).size.height * 0.3
                                : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Target Audience',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                SizedBox(
                                  height: UIHelper.textfieldYukseklik(),
                                  child: TextField(
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    controller: _topicController2,
                                    autofocus: false,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                      labelStyle: TextStyle(fontSize: 13),
                                      hintText: 'Marketer, Developer',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                              width: double.infinity,
                              height: 35,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        _topicController.text.isEmpty
                                            ? Color.fromARGB(255, 76, 97, 220)
                                            : Color.fromARGB(255, 76, 97, 220),
                                  ),
                                  onPressed: _topicController.text.isEmpty ||
                                          _keywordsController.text.isEmpty
                                      ? null
                                      : () {},
                                  child: Text(
                                    'Generate',
                                    style: UIHelper.getButtonTextStyle(),
                                  ))),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
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
                            height: 20,
                          ),
                        ])
                  ])))),
    );
  }
}
