import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class MetaTitlesDescriptions extends StatefulWidget {
  const MetaTitlesDescriptions({super.key});

  @override
  State<MetaTitlesDescriptions> createState() => _MetaTitlesDescriptionsState();
}

class _MetaTitlesDescriptionsState extends State<MetaTitlesDescriptions> {
  TextEditingController _topicController = TextEditingController();

  TextEditingController _keywordsController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  List<String> _metaTitlesKeywords = [];
  void _addInterest(String interest) {
    setState(() {
      _metaTitlesKeywords.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      _metaTitlesKeywords.remove(interest);
    });
  }
//Tone eklenmesi

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
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
                    Text('Meta titles and descriptions',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "Write meta titles and descriptions that are optimized for search engines.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Describe your product or service *',
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
                          SizedBox(
                            height: UIHelper.textfieldYukseklik(),
                            child: TextFormField(
                              maxLength: 800,
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: _topicController,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                hintText: 'floaty floral blue maxi dress',
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
                            height: 20,
                          ),
                          Text('Unique features *',
                              style: UIHelper.getBaslikTextStyle()),
                          const SizedBox(height: 5),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                hintText:
                                    'write long-form content, bulk content, personalized',
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
                            children: _metaTitlesKeywords.map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () => _removeInterest(interest),
                              );
                            }).toList(),
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
                                    style: UIHelper.getIcerikTextStyle()),
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
