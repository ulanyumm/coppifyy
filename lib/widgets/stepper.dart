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
  ];
  String selectTone = "Conversational";
  bool selectedDrafts = false;

  int selectedContainerIndex = -1;
  bool isChecked = false;

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

  @override
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
        const Row(
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
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.multiline,
          maxLines: 5,
        ),
        const SizedBox(height: 20),
        const Row(
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
                border: const OutlineInputBorder(),
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
        const SizedBox(
          height: 20,
        ),
        const Row(
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
        const SizedBox(height: 20),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              selectedDrafts = !selectedDrafts;
            });
          },
          child: Row(
            children: [
              const Text('More options', style: TextStyle()),
              IconButton(
                onPressed: () {},
                icon: selectedDrafts
                    ? const Icon(Icons.keyboard_arrow_down)
                    : const Icon(Icons.keyboard_arrow_up),
              ),
            ],
          ),
        ),
        AnimatedContainer(
          color: Colors.white,
          width: double.infinity,
          height: selectedDrafts ? MediaQuery.of(context).size.height * 0.3 : 0,
          duration: const Duration(milliseconds: 300),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          selectedContainerIndex == 0
                              ? const Color.fromARGB(255, 217, 221, 229)
                              : Colors.grey,
                        )),
                        onPressed: () {
                          setState(() {
                            selectedContainerIndex = 0;
                            isChecked = true;
                          });
                        },
                        child: const Text(
                          'First Person',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          selectedContainerIndex == 1
                              ? const Color.fromARGB(255, 217, 221, 229)
                              : Colors.grey,
                        )),
                        onPressed: () {
                          setState(() {
                            selectedContainerIndex = 1;
                            isChecked = true;
                          });
                        },
                        child: const Text(
                          'Second Person',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 50,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                          selectedContainerIndex == 2
                              ? const Color.fromARGB(255, 217, 221, 229)
                              : Colors.grey,
                        )),
                        onPressed: () {
                          setState(() {
                            selectedContainerIndex = 2;
                            isChecked = true;
                          });
                        },
                        child: const Text(
                          'Third Person',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                )
              ]),
              const SizedBox(
                height: 10,
              ),
              const Text('Describe your audience'),
              TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: _topicController,
                autofocus: false,
                minLines: 1,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: const Color.fromARGB(
                    255,
                    255,
                    255,
                    255,
                  ),
                  labelStyle: const TextStyle(fontSize: 13),
                  hintText: 'The Rock Company',
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
        const SizedBox(
          height: 20,
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
                    backgroundColor: const Color.fromARGB(255, 102, 117, 198),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    )),
                onPressed: _topicController.text.isEmpty &&
                        _keywordsController.text.isEmpty
                    ? null
                    : () {},
                child: const Text('Generate Titles'))),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 600,
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              height: 400,
              width: 200,
              child: Column(children: [
                SvgPicture.asset(
                  'assets/images/icons/blog-title-placeholder.svg',
                  width: 100,
                ),
                const SizedBox(height: 10),
                const Text('No titles generated',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text(
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
