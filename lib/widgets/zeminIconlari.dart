import 'package:flutter/cupertino.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:provider/provider.dart';

class PreviewZeminIconlari extends StatelessWidget {
  PreviewZeminIconlari({
    super.key,
  });
  List<int> idler = [1, 2, 3, 4];

  @override
  Widget build(BuildContext context) {
    var zeminModel = Provider.of<ZeminViewModel>(context);
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /*  ListView.builder(
            itemBuilder: (context, index) {
              return Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      zeminModel.ActionMethod(
                        0,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                        'assets/images/icons/editIcon/like.svg',
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      zeminModel.ActionMethod(
                        1,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                          'assets/images/icons/editIcon/unlike.svg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      zeminModel.ActionMethod(
                        2,
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
                      zeminModel.ActionMethod(
                        3,
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: SvgPicture.asset(
                          'assets/images/icons/editIcon/delete.svg'),
                    ),
                  ),
                ],
              );
            },
            itemCount: idler.length), */
        SizedBox(
          width: 15,
        )
      ],
    );
  }
}
