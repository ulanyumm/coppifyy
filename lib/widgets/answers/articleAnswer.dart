import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';

class ArticleAnsver extends StatefulWidget {
  ArticleAnsver({
    Key? key,
    /*  required this.title;
    required this.audience;
    required this.title;
    required this.title;
    required this.title;
    required this.title;
    required this.title;
    required this.title;

 */
    required this.contents,
    required this.named,
  }) : super(key: key);
  String contents;
  String named;

  @override
  State<ArticleAnsver> createState() => _ArticleAnsverState();
}

class _ArticleAnsverState extends State<ArticleAnsver> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 10),
        /*  Padding(
          padding: const EdgeInsets.only(left: 15, top: 20),
          child: Text(widget.named),
        ), */

        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 20),
          child: TextFormField(
            controller: TextEditingController(text: widget.contents),
            autofocus: false,
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
      ]),
    );
  }
}
