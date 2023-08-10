import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/askAnyThing_viewmodel.dart';
import 'package:provider/provider.dart';

class AskAiAnythingAnswer extends StatefulWidget {
  AskAiAnythingAnswer({
    Key? key,
    required this.contents,
  }) : super(key: key);
  String contents;

  @override
  State<AskAiAnythingAnswer> createState() => _AskAiAnythingAnswerState();
}

class _AskAiAnythingAnswerState extends State<AskAiAnythingAnswer> {
  @override
  void initState() {
    super.initState();
    Provider.of<AskAnyThingViewModel>(context, listen: false)
        .updateCharacterCount(widget.contents);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text('Ask AI Anything'),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            onChanged: (value) {
              Provider.of<AskAnyThingViewModel>(context)
                  .updateCharacterCount(value);
            },
            controller: TextEditingController(text: widget.contents),
            autofocus: false,
            minLines: 3,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.4, color: Color.fromARGB(255, 137, 171, 247)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromARGB(255, 233, 236, 239)),
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(10),
              filled: true,
              fillColor: UIHelper.fillColor(),
              labelStyle: TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0.02,
                  color: Color.fromARGB(255, 233, 236, 239),
                ),
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
        Padding(
          padding: EdgeInsets.only(left: 285),
          child: Text(
              "${Provider.of<AskAnyThingViewModel>(context).characterCount} charaters",
              style: TextStyle(fontSize: 13, color: Colors.grey)),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset(
                'assets/images/icons/editIcon/like.svg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  SvgPicture.asset('assets/images/icons/editIcon/unlike.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: SvgPicture.asset('assets/images/icons/editIcon/copy.svg'),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child:
                  SvgPicture.asset('assets/images/icons/editIcon/delete.svg'),
            ),
            SizedBox(
              width: 15,
            )
          ],
        ),
      ]),
    );
  }
}
