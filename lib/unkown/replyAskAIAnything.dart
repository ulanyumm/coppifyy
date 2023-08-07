import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReplyAskAIAnyThing extends StatefulWidget {
  const ReplyAskAIAnyThing({super.key});

  @override
  State<ReplyAskAIAnyThing> createState() => _ReplyAskAIAnyThingState();
}

class _ReplyAskAIAnyThingState extends State<ReplyAskAIAnyThing> {
  TextEditingController _topicController = TextEditingController();
  bool selectedDrafts = false;
  bool selectedAnything = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(246, 249, 245, 245),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        selectedDrafts = !selectedDrafts;
                      });
                    },
                    icon: selectedDrafts
                        ? Icon(Icons.keyboard_arrow_down)
                        : Icon(Icons.keyboard_arrow_right),
                  ),
                  Text('Drafts',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: AnimatedContainer(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: double.infinity,
                    height:
                        selectedDrafts ? MediaQuery.of(context).size.height : 0,
                    alignment: selectedDrafts
                        ? Alignment.center
                        : AlignmentDirectional.topCenter,
                    duration: const Duration(milliseconds: 300),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              Text('Ask AI anything 1',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: _topicController,
                                autofocus: true,
                                minLines: 4,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.grey, width: 2.0),
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
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
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
