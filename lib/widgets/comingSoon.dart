import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 3,
          child: SvgPicture.asset(
            'assets/images/icons/comingsoon.svg',
          ),
        ),
      ),
    );
  }
}
