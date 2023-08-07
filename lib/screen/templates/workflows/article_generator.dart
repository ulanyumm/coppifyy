import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class ArticleGenerator extends StatefulWidget {
  const ArticleGenerator({super.key});

  @override
  State<ArticleGenerator> createState() => _ArticleGeneratorState();
}

class _ArticleGeneratorState extends State<ArticleGenerator> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _topicController2 = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

//Tone eklenmesi
  List<String> typeList = [
    "Scientific",
    "Technical",
    "Essay",
    "Opinion/Editorial",
  ];
  String selectType = "Scientific";

  bool selectedAnything = false;
  bool selectedDrafts = false;
  bool introduction = false;
  bool conclusion = false;

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _topicController2 = TextEditingController();
    _topicController = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
    _topicController2.dispose();
    super.dispose();
  }

  TextEditingController _keywordsController = TextEditingController();
  TextEditingController _outlineController = TextEditingController();

  List<String> _articleGeneratorKeywordsContext = [];
  List<String> _articleGeneratorOutlineContext = [];

  void _addInterest(String interest) {
    setState(() {
      _articleGeneratorOutlineContext.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      _articleGeneratorOutlineContext.remove(interest);
    });
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
                    Text('Article Generator',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Turn a title and an outline into a fully SEO-optimized and long article with this AI editor.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Article Title *',
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
                                hintText: 'a discount social media post',
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
                            'Audience',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          SizedBox(
                            height: UIHelper.textfieldYukseklik(),
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: _topicController2,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                hintText: 'a stiletto heel',
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
                          Text('Keywords',
                              style: UIHelper.getBaslikTextStyle()),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: UIHelper.textfieldYukseklik(),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: 'Include mentions of stoicisim',
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
                            children: _articleGeneratorKeywordsContext
                                .map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () => _removeInterest(interest),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Type',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
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
                              value: selectType,
                              onChanged: (value) {
                                setState(() {
                                  selectType = value!.toString();
                                });
                              },
                              items: typeList.map((itemone) {
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Outline',
                                style: UIHelper.getBaslikTextStyle(),
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(Icons.bolt),
                              Text(
                                'Write the outline of your AI',
                                style: UIHelper.getIcerikTextStyle(),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: UIHelper.textfieldYukseklik(),
                            child: TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText:
                                    'Add a talking point for this paragraph',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    _addInterest(
                                        _outlineController.text.trim());
                                    _outlineController.clear();
                                  },
                                ),
                              ),
                              controller: _outlineController,
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            children:
                                _articleGeneratorOutlineContext.map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () => _removeInterest(interest),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Row(children: [
                                Checkbox(
                                    checkColor: Colors.blue,
                                    value: introduction,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        introduction = value!;
                                      });
                                    }),
                                Text('Introduction',
                                    style: UIHelper.getButtonTextStyle()),
                              ]),
                              Row(
                                children: [
                                  Checkbox(
                                      checkColor: Colors.blue,
                                      value: conclusion,
                                      onChanged: (bool? value) {
                                        setState(() {
                                          conclusion = value!;
                                        });
                                      }),
                                  Text('Conclusion',
                                      style: UIHelper.getButtonTextStyle()),
                                ],
                              ),
                            ],
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
                                  onPressed: _topicController.text.isEmpty
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
