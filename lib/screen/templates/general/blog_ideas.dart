import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class BlogIdeas extends StatefulWidget {
  const BlogIdeas({super.key});

  @override
  State<BlogIdeas> createState() => _BlogIdeasState();
}

class _BlogIdeasState extends State<BlogIdeas> {
  TextEditingController _topicController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey _key = GlobalKey();
  bool selectedRewrite = false;
  bool selectedMoreOptions = false;
  int selectedButtonIndex = -1;
  bool isChecked = false;

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
                    Text('Blog Ideas', style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SingleChildScrollView(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Don't know what to tweet? Get ideas for tweets that will engage your followers.",
                          style: UIHelper.getIcerikTextStyle(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'What is this blog about? *',
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
                                minLines: 4,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  hintText: "tesla cars",
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
                                    MediaQuery.of(context).size.height * 0.035,
                              ),
                              Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height *
                                      0.035,
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
                                      onPressed: _topicController.text.isEmpty
                                          ? null
                                          : () {},
                                      child: Text(
                                        'Generate',
                                        style: UIHelper.getButtonTextStyle(),
                                      ))),
                            ],
                          ),
                        )
                      ],
                    )),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
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
                        ])
                  ])))),
    );
  }
}
