import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class VideoTimelineTool extends StatefulWidget {
  const VideoTimelineTool({super.key});

  @override
  State<VideoTimelineTool> createState() => _VideoTimelineToolState();
}

class _VideoTimelineToolState extends State<VideoTimelineTool> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _platformName = TextEditingController();
  TextEditingController _videoMinController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _videoMinController = TextEditingController();
    _topicController = TextEditingController();
    _platformName = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
    _videoMinController.dispose();
    _platformName.dispose();
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
                    Text(
                      'Video Timeline Tool',
                      style: UIHelper.getAnaBaslikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "An AI tool that allows you to create a second-by-second timeline for your videos.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      'Video topic *',
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
                            minLines: 5,
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
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text(
                            'Video Length (min) *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _videoMinController,
                            autofocus: false,
                            minLines: 1,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: '1',
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
                          Text(
                            'Platform Name *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _platformName,
                            autofocus: false,
                            minLines: 1,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Youtube, Tiktok, Instagram, etc',
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
                                          _videoMinController.text.isEmpty
                                      ? null
                                      : () {},
                                  child: Text('Generate',
                                      style: UIHelper.getButtonTextStyle()))),
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
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ])
                  ])))),
    );
  }
}
