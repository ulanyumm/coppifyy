import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/general_viewModel.dart';

class GoogleAdsAnswer extends StatelessWidget {
  GoogleAdsAnswer({super.key, 
    required this.contents,
    required this.title,
  });

  String title;
  String contents;

  GeneralModelViewModel viewModel = GeneralModelViewModel();
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Headline',
              style: UIHelper.getBaslikTextStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              child: TextFormField(
                onTapOutside: ((event) {
                  FocusScope.of(context).unfocus();
                }),
                controller: TextEditingController(text: title),
                autofocus: false,
                minLines: 1,
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
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Description',
              style: UIHelper.getBaslikTextStyle(),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              controller: TextEditingController(text: contents),
              autofocus: false,
              minLines: 5,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.all(10),
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
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
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
                  child: SvgPicture.asset(
                      'assets/images/icons/editIcon/unlike.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child:
                      SvgPicture.asset('assets/images/icons/editIcon/copy.svg'),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                      'assets/images/icons/editIcon/delete.svg'),
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
  }
}
