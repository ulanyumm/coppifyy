import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class GoogleAdsScreen extends StatefulWidget {
  const GoogleAdsScreen({super.key});

  @override
  State<GoogleAdsScreen> createState() => _GoogleAdsScreenState();
}

class _GoogleAdsScreenState extends State<GoogleAdsScreen> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _topicController2 = TextEditingController();
  TextEditingController _topicController3 = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextEditingController _keywordsController = TextEditingController();
  List<String> adsKeywords = [];
  void _addInterest(String interest) {
    setState(() {
      adsKeywords.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      adsKeywords.remove(interest);
    });
  }
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
    adsKeywords = [];
    _keywordsController = TextEditingController();
    _topicController = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
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
                    Text('Google Ads', style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Create effective and persuasive ads that generate leads and sales.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'What is your post about *',
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
                            textAlignVertical: TextAlignVertical.top,
                            maxLength: 800,
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _topicController,
                            autofocus: false,
                            minLines: 2,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              hintText:
                                  'Superbounce Running Shoes, minimalist running shoes, responsive bounce',
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text('Keywords *',
                              style: UIHelper.getBaslikTextStyle()),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                isDense: true,
                                border: OutlineInputBorder(),
                                hintText: 'best shoes for road running',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    _addInterest(
                                        _keywordsController.text.trim());
                                    _keywordsController.clear();
                                  },
                                ),
                              ),
                              controller: _keywordsController,
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            children: adsKeywords.map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () => _removeInterest(interest),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                          SizedBox(height: 5),
                          Container(
                            height: UIHelper.dropdownYukseklik(),
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
                            height: MediaQuery.of(context).size.height * 0.02,
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
                                ? MediaQuery.of(context).size.height * 0.19
                                : 0,
                            duration: const Duration(milliseconds: 300),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Target Audience',
                                    style: UIHelper.getBaslikTextStyle()),
                                SizedBox(height: 5),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _topicController2,
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
                                    hintText: 'urban long distance runners',
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
                                Text('Brand',
                                    style: UIHelper.getBaslikTextStyle()),
                                SizedBox(height: 5),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  textAlignVertical: TextAlignVertical.bottom,
                                  controller: _topicController3,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    labelStyle: TextStyle(fontSize: 13),
                                    hintText: '',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.04,
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
                                  child: Text('Generate',
                                      style: UIHelper.getButtonTextStyle()))),
                        ],
                      ),
                    ),
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
