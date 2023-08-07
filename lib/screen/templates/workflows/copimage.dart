import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class CopiMageScreen extends StatefulWidget {
  const CopiMageScreen({super.key});

  @override
  State<CopiMageScreen> createState() => _CopiMageScreenState();
}

class _CopiMageScreenState extends State<CopiMageScreen> {
  TextEditingController _topicController = TextEditingController();
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  List<String> gpuStrength = ["Light", "Medium", "Hard", "Heavy", "Maximum"];
  List<String> styleList = [
    "3d Model",
    "Pixel Art",
    "Comic Book",
    "Isometric",
    "Analog Film",
    "Digital Art",
    "Line Art",
    "Anime",
    "Enhance",
    "Low Poly",
    "Cinematic",
    "Fantasy Art",
    "Modeling Compound",
    "Neon Punk",
    "Origami",
    "Photographic",
    "Tile Texture"
  ];
  List<String> imageMediumList = [
    "None",
    "Acrylcs",
    "Canvas",
    "Chalk",
    "Charcoal",
    "Classic Oil",
    "Crayon",
    "Glass",
    "Ink",
    "Modem Oil Painting",
    "Pastel",
    "Pencil",
    "Spray Paint",
    "Water Color Painting",
    "Wood Panel"
  ];
  List<String> imageMoodList = [
    "None",
    "Aggressive",
    "Angry",
    "Boring",
    "Calm",
    "Cheerfull",
    "Chilling",
    "Colorful",
    "Dark",
    "Neutural"
  ];
  String selectStrength = "Light";
  String selectStyle = "3d Model";
  String selectMedium = "None";
  String selectMood = "None";

  GlobalKey _key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController();
  }

  void dispose() {
    _topicController.dispose();
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
                    Text('CopiMage', style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Generate professional quality images from text for your website or blog",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Image Description',
                      style: UIHelper.getBaslikTextStyle(),
                    ),
                    Form(
                      key: _key,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            maxLength: 1500,
                            onChanged: (value) {
                              setState(() {});
                            },
                            controller: _topicController,
                            autofocus: false,
                            minLines: 5,
                            decoration: InputDecoration(
                              hintText:
                                  'Photography of an astronaut driving a sports car on the moon',
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
                          Text('Promt input must be always in English',
                              style: UIHelper.getIcerikTextStyle()),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Gpu Strength',
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
                              value: selectStrength,
                              onChanged: (value) {
                                setState(() {
                                  selectStrength = value!.toString();
                                });
                              },
                              items: gpuStrength.map((itemone) {
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
                          Text(
                            'Style',
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
                              value: selectStyle,
                              onChanged: (value) {
                                setState(() {
                                  selectStyle = value!.toString();
                                });
                              },
                              items: styleList.map((itemone) {
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
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    'Medium',
                                  ),
                                  Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButton(
                                      focusColor: Colors.grey,
                                      elevation: 0,
                                      underline: Container(),
                                      isExpanded: true,
                                      value: selectMedium,
                                      onChanged: (value) {
                                        setState(() {
                                          selectMedium = value!.toString();
                                        });
                                      },
                                      items: imageMediumList.map((itemone) {
                                        return DropdownMenuItem(
                                            value: itemone,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text(itemone),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Text(
                                    'Mood',
                                  ),
                                  Container(
                                    height: 50,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: DropdownButton(
                                      focusColor: Colors.grey,
                                      elevation: 0,
                                      underline: Container(),
                                      isExpanded: true,
                                      value: selectMood,
                                      onChanged: (value) {
                                        setState(() {
                                          selectMood = value!.toString();
                                        });
                                      },
                                      items: imageMoodList.map((itemone) {
                                        return DropdownMenuItem(
                                            value: itemone,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text(itemone),
                                            ));
                                      }).toList(),
                                    ),
                                  ),
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
