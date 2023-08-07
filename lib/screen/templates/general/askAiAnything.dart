import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/generate_button.dart';
import 'package:hypotenuse/widgets/not_content.dart';

class AskAIAnyThing extends StatefulWidget {
  const AskAIAnyThing({super.key});

  @override
  State<AskAIAnyThing> createState() => _AskAIAnyThingState();
}

class _AskAIAnyThingState extends State<AskAIAnyThing> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _keywordsController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<String> _askAnyThingAdditionalContext = [];
  void _addInterest(String interest) {
    setState(() {
      _askAnyThingAdditionalContext.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      _askAnyThingAdditionalContext.remove(interest);
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
    _askAnyThingAdditionalContext = [];
    _keywordsController = TextEditingController();
    _topicController = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
    _keywordsController.dispose();
    super.dispose();
  }

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
            padding: UIHelper.getDefaultPadding(),
            child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UIHelper.altUstBosluk(),
                      Expanded(
                          child: SingleChildScrollView(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Ask AI anything',
                                  style: UIHelper.getAnaBaslikTextStyle()),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedAnything = !selectedAnything;
                                  });
                                },
                                child: SingleChildScrollView(
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        UIHelper.kisaAraBosluk(),
                                        Text(
                                          'Instruct our AI, from answering questions to writting custom content for any project.',
                                          style: UIHelper.getIcerikTextStyle(),
                                        ),
                                        UIHelper.uzunAraBosluk(),
                                        UIHelper.uzunAraBosluk(),
                                        Text('Instruction or queston *',
                                            style:
                                                UIHelper.getBaslikTextStyle()),
                                        UIHelper.kisaAraBosluk(),
                                        Form(
                                          key: _key,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              TextFormField(
                                                maxLength: 6000,
                                                onChanged: (value) {
                                                  setState(() {});
                                                },
                                                controller: _topicController,
                                                autofocus: false,
                                                minLines: 4,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      EdgeInsets.all(10),
                                                  isDense: true,
                                                  filled: true,
                                                  fillColor: Color.fromARGB(
                                                    255,
                                                    255,
                                                    255,
                                                    255,
                                                  ),
                                                  hintStyle:
                                                      TextStyle(fontSize: 13),
                                                  hintText:
                                                      'Write an introduction to an essay about philosophy',
                                                  border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                ),
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: null,
                                              ),
                                              UIHelper.kisaAraBosluk(),
                                              Text('Additional Context *',
                                                  style: UIHelper
                                                      .getBaslikTextStyle()),
                                              UIHelper.kisaAraBosluk(),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                child: TextField(
                                                  decoration: InputDecoration(
                                                    isDense: true,
                                                    contentPadding:
                                                        EdgeInsets.all(10),
                                                    border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
                                                    hintStyle:
                                                        TextStyle(fontSize: 13),
                                                    hintText:
                                                        'Include mentions of stoicisim',
                                                    suffixIcon: IconButton(
                                                      padding: EdgeInsets.zero,
                                                      icon: const Icon(Icons
                                                          .add_circle_outline),
                                                      onPressed: () {
                                                        _addInterest(
                                                            _keywordsController
                                                                .text
                                                                .trim());
                                                        _keywordsController
                                                            .clear();
                                                      },
                                                    ),
                                                  ),
                                                  controller:
                                                      _keywordsController,
                                                ),
                                              ),
                                              Wrap(
                                                spacing: 8,
                                                children:
                                                    _askAnyThingAdditionalContext
                                                        .map((interest) {
                                                  return Chip(
                                                    label: Text(interest),
                                                    onDeleted: () =>
                                                        _removeInterest(
                                                            interest),
                                                  );
                                                }).toList(),
                                              ),
                                              UIHelper.uzunAraBosluk(),
                                              Text('Tone *',
                                                  style: UIHelper
                                                      .getBaslikTextStyle()),
                                              UIHelper.kisaAraBosluk(),
                                              Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.04,
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                      width: 1,
                                                      color: Colors.grey),
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: DropdownButton(
                                                  focusColor: Colors.grey,
                                                  elevation: 0,
                                                  underline: Container(),
                                                  isExpanded: true,
                                                  value: selectTone,
                                                  onChanged: (value) {
                                                    setState(() {
                                                      selectTone =
                                                          value!.toString();
                                                    });
                                                  },
                                                  items:
                                                      listTone.map((itemone) {
                                                    return DropdownMenuItem(
                                                        value: itemone,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  left: 20.0),
                                                          child: Text(
                                                            itemone,
                                                            style: TextStyle(
                                                                fontSize: 13),
                                                          ),
                                                        ));
                                                  }).toList(),
                                                ),
                                              ),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.03,
                                              ),
                                              GenerateButton(
                                                  keywordsController:
                                                      _keywordsController,
                                                  topicController:
                                                      _topicController),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              ),
                              Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    NoContent(),
                                  ]),
                            ]),
                      ))
                    ])),
          )),
    );
  }
}
