import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hypotenuse/viewmodel/instagram_viewmodel.dart';
import 'package:provider/provider.dart';

class CaptionEditWidget extends StatefulWidget {
  CaptionEditWidget({
    Key? key,
    required this.contents,
  }) : super(key: key);
  String contents;

  @override
  State<CaptionEditWidget> createState() => _CaptionEditWidgetState();
}

class _CaptionEditWidgetState extends State<CaptionEditWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<InstagramViewModel>(context, listen: false)
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
          child: Text('Caption'),
        ),
        SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            onChanged: (value) {
              Provider.of<InstagramViewModel>(context)
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
              fillColor: Color.fromARGB(
                255,
                255,
                255,
                255,
              ),
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
              "${Provider.of<InstagramViewModel>(context).characterCount} charaters",
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
