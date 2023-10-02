import 'package:flutter/material.dart';

class ReplyAskAIAnyThing extends StatefulWidget {
  const ReplyAskAIAnyThing({super.key});

  @override
  State<ReplyAskAIAnyThing> createState() => _ReplyAskAIAnyThingState();
}

class _ReplyAskAIAnyThingState extends State<ReplyAskAIAnyThing> {
  final TextEditingController _topicController = TextEditingController();
  bool selectedDrafts = false;
  bool selectedAnything = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(246, 249, 245, 245),
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
                        ? const Icon(Icons.keyboard_arrow_down)
                        : const Icon(Icons.keyboard_arrow_right),
                  ),
                  const Text('Drafts',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: AnimatedContainer(
                    color: const Color.fromARGB(255, 255, 255, 255),
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
                              const SizedBox(
                                height: 30,
                              ),
                              const Text('Ask AI anything 1',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(
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
                                  fillColor: const Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  labelStyle: const TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const SizedBox(
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
