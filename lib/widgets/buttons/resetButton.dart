import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:provider/provider.dart';

class ResetButton extends StatelessWidget {
  ResetButton({
    required this.count,
    super.key,
  });
  int count;

  @override
  Widget build(BuildContext context) {
    var zeminModel = Provider.of<ZeminViewModel>(context);
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/images/icons/refresh.svg'),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Reset All',
              style: TextStyle(
                  fontSize: 12, color: Color.fromARGB(255, 203, 72, 72)),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 233, 236, 239),
                borderRadius: BorderRadius.circular(5)),
            child: Center(child: Text('$count')),
          ),
        ],
      ),
    );
  }
}
