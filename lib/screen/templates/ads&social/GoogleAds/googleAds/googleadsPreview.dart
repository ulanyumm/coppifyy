import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/general_viewModel.dart';
import 'package:provider/provider.dart';

class GoogleAdsPreview extends StatelessWidget {
  GoogleAdsPreview({super.key, 
    required this.contents,
    required this.title,
  });

  final String title;
  final String contents;
  final String userName = 'ulanyum@mail.ru';
  GeneralModelViewModel viewModel = GeneralModelViewModel();
  @override
  Widget build(BuildContext context) {
    return Consumer<GeneralModelViewModel>(
      builder: (context, viewModel, child) {
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  'Ad . $userName',
                  style: UIHelper.getBaslikTextStyle(),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 30, 64, 175)),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Text(
                  contents,
                  style: const TextStyle(
                      fontSize: 14,
                      height: 1.5,
                      color: Colors.grey,
                      fontWeight: FontWeight.normal),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01),
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
                      child: SvgPicture.asset(
                          'assets/images/icons/editIcon/copy.svg'),
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
      },
    );
  }
}
