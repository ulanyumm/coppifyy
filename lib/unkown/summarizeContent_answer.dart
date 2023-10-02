import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:provider/provider.dart';

class SummarizeAnswer extends StatefulWidget {
  const SummarizeAnswer({
    Key? key,
    required this.contents,
    required this.id,
    required this.named,
    required this.onDismiss,
  }) : super(key: key);

  final String contents;
  final String named;
  final int id;
  final VoidCallback onDismiss;
  @override
  State<SummarizeAnswer> createState() => _SummarizeAnswerState();
}

class _SummarizeAnswerState extends State<SummarizeAnswer> {
  @override
  Widget build(BuildContext context) {
    var zeminModel = Provider.of<ZeminViewModel>(context);

    return Dismissible(
      key: Key(widget.contents),
      onDismissed: (direction) {
        widget
            .onDismiss(); // Silme işlemini gerçekleştirildiğinde onDismiss işlevini çağırın
      },
      child: Card(
        elevation: 1,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 20),
            child: Text(widget.named),
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
              GestureDetector(
                onTap: () {
                  // zeminModel.ActionMethod(1, widget.model.id!);

                  zeminModel.likeColorChangedFunc();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/editIcon/like.svg',
                    color:
                        zeminModel.likeColorChanged ? Colors.blueAccent : null,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //  zeminModel.ActionMethod(2, widget.model.id!);
                  zeminModel.unlikeColorChangedFunc();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/images/icons/editIcon/unlike.svg',
                    color: zeminModel.unlikeColorChanged ? Colors.red : null,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  //  zeminModel.ActionMethod(3, widget.model.id!, text: widget.contents);
                  Clipboard.setData(ClipboardData(text: widget.contents));
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      SvgPicture.asset('assets/images/icons/editIcon/copy.svg'),
                ),
              ),
              GestureDetector(
                onTap: () {
                  widget.onDismiss();
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                      'assets/images/icons/editIcon/delete.svg'),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ]),
      ),
    );
  }
}
