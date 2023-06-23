import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Steppers extends StatefulWidget {
  const Steppers({
    super.key,
  });

  @override
  State<Steppers> createState() => _SteppersState();
}

class _SteppersState extends State<Steppers> {
  TextEditingController _topicController = TextEditingController();
  TextEditingController _keywordsController = TextEditingController();
  //tag listesi
  List<String> _interests = [];
//tone listesi
  List<String> listTone = [
    "Conversational",
    "Enthusiatic",
    "Humorous",
    "Professional",
    "Describe a tone",
    "Your brand's tone"
  ];
  String selectTone = "Conversational";
  List<String> listLength = [
    "Short (~800 words)",
    "Medium (~1,500 words)",
    "Long (~3,000 words)",
  ];
  String selectLength = "Medium (~1,500 words)";

  bool _switchValue = true;
//tag eklenmesi
  void _addInterest(String interest) {
    setState(() {
      _interests.add(interest);
    });
  }

//tag silinmesi
  void _removeInterest(String interest) {
    setState(() {
      _interests.remove(interest);
    });
  }

//İnit ve dispose
  @override
  void initState() {
    super.initState();
    _interests = [];
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
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            Text(
              'Describe yotu topic *',
            ),
          ],
        ),
        TextField(
          onChanged: (value) {
            setState(() {});
          },
          controller: _topicController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Text(
              'Primary keywords *',
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'best writting tools',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: () {
                    _addInterest(_keywordsController.text.trim());
                    _keywordsController.clear();
                  },
                ),
              ),
              controller: _keywordsController,
            ),
            Wrap(
              spacing: 8,
              children: _interests.map((interest) {
                return Chip(
                  label: Text(interest),
                  onDeleted: () => _removeInterest(interest),
                );
              }).toList(),
            ),
            const SizedBox(height: 16),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            Text(
              'Tone',
            ),
          ],
        ),
        Container(
          height: 50,
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
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(itemone),
                  ));
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
        Text('Length'),
        SizedBox(height: 20),
        Container(
          height: 50,
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
            value: selectLength,
            onChanged: (value) {
              setState(() {
                selectLength = value!.toString();
              });
            },
            items: listLength.map((itemone) {
              return DropdownMenuItem(
                  value: itemone,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text(itemone),
                  ));
            }).toList(),
          ),
        ),
        SizedBox(height: 20),
        Row(children: [
          CupertinoSwitch(
            activeColor: Color.fromARGB(255, 76, 97, 220),
            value: _switchValue,
            onChanged: (value) {
              setState(() {
                _switchValue = value;
              });
            },
          ),
          SizedBox(width: 20),
          Text('Write your own title'),
        ]),
        SizedBox(
          height: 20,
        ),
        ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          title: Text('More Expansion',
              style: TextStyle(
                fontSize: 20,
                color: Colors.indigo,
              )),
          children: [
            Text('Point of view'), //overlay
            //ne olduğunu bilmediğim bişey.

            Row(
              children: [
                Text(
                  'Describe your audience', //overlay
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Describe your brand', //overlay
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 2,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(
                  'Describe your product or service', //overlay
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: 2,
            ),
            SizedBox(height: 20),
          ],
        ),
        Container(
            width: double.infinity,
            height: 35,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.circular(30),
            ),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 102, 117, 198),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: _topicController.text.isEmpty &&
                        _keywordsController.text.isEmpty
                    ? null
                    : () {},
                child: Text('Generate Titles'))),
        SizedBox(height: 10),
        Container(
          width: double.infinity,
          height: 600,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              height: 400,
              width: 200,
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/icons/blog-title-placeholder.svg',
                  width: 100,
                ),
                SizedBox(height: 10),
                Text('No titles generated',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text(
                  'Describle your topic to our AI to start generating creative article ideas and titles.',
                  textAlign: TextAlign.center,
                )
              ]),
            )
          ]),
        )
      ]),
    ));
  }
}
