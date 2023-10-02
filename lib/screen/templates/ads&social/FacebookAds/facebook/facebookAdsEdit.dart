import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/general_viewModel.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:provider/provider.dart';

class FacebookAdsEdit extends StatefulWidget {
  FacebookAdsEdit({
    Key? key,
    required this.title,
    required this.contents,
    required this.onDismiss,
    required this.id,
  }) : super(key: key);
  String title;
  String contents;
  int id;
  final VoidCallback onDismiss;

  @override
  State<FacebookAdsEdit> createState() => _FacebookAdsEditState();
}

class _FacebookAdsEditState extends State<FacebookAdsEdit> {
  @override
  Widget build(BuildContext context) {
    var zeminModel = Provider.of<ZeminViewModel>(context);
    return Dismissible(
      key: Key(widget.contents),
      onDismissed: (direction) {
        widget.onDismiss();
      },
      child: Consumer<GeneralModelViewModel>(
        builder: (context, viewModel, child) {
          return Card(
            elevation: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 20),
                  child: Text('Headline'),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    onTapOutside: ((event) {
                      FocusScope.of(context).unfocus();
                    }),
                    maxLength: 200,
                    controller: TextEditingController(text: widget.title),
                    autofocus: false,
                    maxLines: null,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(8),
                      filled: true,
                      fillColor: UIHelper.fillColor(),
                      labelStyle: const TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                const Padding(
                  padding: EdgeInsets.only(left: 15, top: 10),
                  child: Text('Content'),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: TextFormField(
                    controller: TextEditingController(text: widget.contents),
                    autofocus: false,
                    minLines: 3,
                    maxLines: null,
                    maxLength: 10000,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(8),
                      filled: true,
                      fillColor: UIHelper.fillColor(),
                      labelStyle: const TextStyle(fontSize: 13),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
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
                          'assets/images/icons/editIcon/delete.svg',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    )
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
