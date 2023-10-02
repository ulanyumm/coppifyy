import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/general_viewModel.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:provider/provider.dart';

class TotalAnswer extends StatefulWidget {
  const TotalAnswer({
    Key? key,
    required this.contents,
    required this.id,
    required this.title,
    required this.onDismiss,
  }) : super(key: key);

  final String title;
  final String contents;
  final int id;
  final VoidCallback onDismiss;

  @override
  State<TotalAnswer> createState() => _TotalAnswerState();
}

class _TotalAnswerState extends State<TotalAnswer> {
  @override
  Widget build(BuildContext context) {
    var zeminModel = Provider.of<ZeminViewModel>(context);
    return Consumer<GeneralModelViewModel>(
      builder: (context, viewModel, child) {
        return Dismissible(
          key: Key(widget.contents),
          onDismissed: (direction) {
            widget.onDismiss();
          },
          child: Card(
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text('Title'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    onTapOutside: ((event) {
                      FocusScope.of(context).unfocus();
                    }),
                    textAlignVertical: TextAlignVertical.top,
                    controller: TextEditingController(text: widget.title),
                    autofocus: false,
                    minLines: 1,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      isDense: true,
                      filled: true,
                      fillColor: UIHelper.fillColor(),
                      labelStyle: const TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text('Description'),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    onTapOutside: ((event) {
                      FocusScope.of(context).unfocus();
                    }),
                    textAlignVertical: TextAlignVertical.top,
                    controller: TextEditingController(text: widget.contents),
                    autofocus: false,
                    minLines: 3,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(10),
                      isDense: true,
                      filled: true,
                      fillColor: UIHelper.fillColor(),
                      labelStyle: const TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        zeminModel.likeColorChangedFunc();
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                          'assets/images/icons/editIcon/like.svg',
                          color: zeminModel.likeColorChanged
                              ? Colors.blueAccent
                              : null,
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
                          color:
                              zeminModel.unlikeColorChanged ? Colors.red : null,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: widget.contents));
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Copied'),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: SvgPicture.asset(
                            'assets/images/icons/editIcon/copy.svg'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.onDismiss();
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Deleted'),
                          ),
                        );
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
              ],
            ),
          ),
        );
      },
    );
  }
}
