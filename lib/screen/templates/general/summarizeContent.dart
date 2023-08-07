import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class SummarizeContent extends StatefulWidget {
  const SummarizeContent({super.key});

  @override
  State<SummarizeContent> createState() => _SummarizeContentState();
}

class _SummarizeContentState extends State<SummarizeContent> {
  TextEditingController _topicController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey _key = GlobalKey();
  bool selectedRewrite = false;
  int selectedButtonIndex = -1;
  bool isChecked = false;
  List<String> listTone = ["Paragraph", "Bullet Points"];
  String selectTone = "Paragraph";
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
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Expanded(
                            child: SingleChildScrollView(
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                              Text('Summarize content',
                                  style: UIHelper.getAnaBaslikTextStyle()),
                              SingleChildScrollView(
                                  child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                      'Summarize content to make it more concise and say more with less..'),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.02,
                                  ),
                                  Text(
                                    'Text to summarize *',
                                    style: UIHelper.getBaslikTextStyle(),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Form(
                                    key: _key,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          maxLength: 60000,
                                          onChanged: (value) {
                                            setState(() {});
                                          },
                                          controller: _topicController,
                                          autofocus: false,
                                          minLines: 10,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color.fromARGB(
                                              255,
                                              255,
                                              255,
                                              255,
                                            ),
                                            labelStyle: TextStyle(fontSize: 13),
                                            hintText:
                                                'Summarize content to make it more concise and say more with less.',
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                          ),
                                          keyboardType: TextInputType.multiline,
                                          maxLines: null,
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.03,
                                        ),
                                        Text('Type *',
                                            style:
                                                UIHelper.getBaslikTextStyle()),
                                        SizedBox(height: 5),
                                        Container(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 1, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                        const EdgeInsets.only(
                                                            left: 20.0),
                                                    child: Text(itemone),
                                                  ));
                                            }).toList(),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.04,
                                        ),
                                        Container(
                                            width: double.infinity,
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.04,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor:
                                                      _topicController.text.isEmpty
                                                          ? Color.fromARGB(
                                                              255, 76, 97, 220)
                                                          : Color.fromARGB(
                                                              255, 76, 97, 220),
                                                ),
                                                onPressed: _topicController
                                                        .text.isEmpty
                                                    ? null
                                                    : () {},
                                                child: Text(
                                                  'Generate',
                                                  style: UIHelper
                                                      .getButtonTextStyle(),
                                                ))),
                                      ],
                                    ),
                                  )
                                ],
                              )),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      height:
                                          MediaQuery.of(context).size.height /
                                              2,
                                      child: Center(
                                        child: Column(children: [
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.03,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/icons/drafts.svg',
                                              height: 120),
                                          Text('No content yet',
                                              style: UIHelper
                                                  .getAnaBaslikTextStyle()),
                                          Text(
                                            'Describe your topic to our AI \n to start writing some \n compelling copy',
                                            textAlign: TextAlign.center,
                                            style:
                                                UIHelper.getIcerikTextStyle(),
                                          ),
                                        ]),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.03,
                                    ),
                                  ])
                            ])))
                      ])))),
    );
  }
}
