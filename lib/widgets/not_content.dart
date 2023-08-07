import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';

class NoContent extends StatelessWidget {
  const NoContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 2,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        SvgPicture.asset(
          'assets/images/icons/drafts.svg',
        ),
        Text('No content yet', style: UIHelper.getAnaBaslikTextStyle()),
        Text(
          'Describe your topic to our AI \n to start writing some \n compelling copy',
          textAlign: TextAlign.center,
          style: UIHelper.getIcerikTextStyle(),
        ),
      ]),
    );
  }
}
