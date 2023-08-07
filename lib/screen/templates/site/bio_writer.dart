import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class BioWriters extends StatefulWidget {
  const BioWriters({super.key});

  @override
  State<BioWriters> createState() => _BioWritersState();
}

class _BioWritersState extends State<BioWriters> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _topicController2 = TextEditingController();
  TextEditingController _topicController3 = TextEditingController();
  TextEditingController _topicController4 = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  TextEditingController _keywordsController = TextEditingController();
  List<String> _bioWritersKeywords = [];
  void _addInterest(String interest) {
    setState(() {
      _bioWritersKeywords.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      _bioWritersKeywords.remove(interest);
    });
  }
//Tone eklenmesi

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _keywordsController = TextEditingController();
    _topicController = TextEditingController();
    _topicController2 = TextEditingController();
    _topicController3 = TextEditingController();
    _topicController4 = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
    _topicController2.dispose();
    _topicController3.dispose();
    _topicController4.dispose();
    _keywordsController.dispose();
    super.dispose();
  }

  List<String> listPointOfView = [
    "Third Person",
    "First Person",
  ];
  String selectPointOfView = "Third Person";
  bool selectedAnything = false;
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
                    Text('Bio Writers',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Elevate any page with a well-written bio that will make people want to know more",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'About person or company *',
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
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _topicController,
                            autofocus: false,
                            minLines: 3,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText:
                                  'digital marketing expert with ower 10 years of experience in content marketing. Worked at Google, Facebook, and Amazon',
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            'Company Name *',
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
                            minLines: 1,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Patty AI',
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            'Keywords *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                hintText: 'like hiking in free time',
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
                            children: _bioWritersKeywords.map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () => _removeInterest(interest),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          Text(
                            'Point of View *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.04,
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
                              value: selectPointOfView,
                              onChanged: (value) {
                                setState(() {
                                  selectPointOfView = value!.toString();
                                });
                              },
                              items: listPointOfView.map((itemone) {
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
                                ? MediaQuery.of(context).size.height * 0.2
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
                                    hintText: 'spring wedding guests',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.03,
                                ),
                                Text(
                                  'Brand',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                  controller: _topicController4,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: Color.fromARGB(
                                      255,
                                      255,
                                      255,
                                      255,
                                    ),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
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
                      height: MediaQuery.of(context).size.height * 0.02,
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
                                Text(
                                  'No content yet',
                                  style: UIHelper.getAnaBaslikTextStyle(),
                                ),
                                Text(
                                  'Describe your topic to our AI \n to start writing some \n compelling copy',
                                  textAlign: TextAlign.center,
                                  style: UIHelper.getIcerikTextStyle(),
                                ),
                              ]),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ])
                  ])))),
    );
  }
}
