import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';

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
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.only(left: 15, top: 20),
          child: Text('Caption'),
        ),
        const SizedBox(
          height: 15,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: TextFormField(
            onTapOutside: ((event) {
              FocusScope.of(context).unfocus();
            }),
            maxLength: 500,
            onChanged: (value) {},
            controller: TextEditingController(text: widget.contents),
            autofocus: false,
            minLines: 3,
            decoration: InputDecoration(
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1.4, color: Color.fromARGB(255, 137, 171, 247)),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromARGB(255, 233, 236, 239)),
              ),
              isDense: true,
              contentPadding: const EdgeInsets.all(10),
              filled: true,
              fillColor: UIHelper.fillColor(),
              labelStyle: const TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderSide: const BorderSide(
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
        const SizedBox(
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
            const SizedBox(
              width: 15,
            )
          ],
        ),
      ]),
    );
  }
}
