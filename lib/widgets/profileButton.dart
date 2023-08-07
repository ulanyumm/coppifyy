import 'package:flutter/cupertino.dart';
import 'package:flutter_initicon/flutter_initicon.dart';

class ProfileButton extends StatefulWidget {
  const ProfileButton({super.key});

  @override
  State<ProfileButton> createState() => _ProfileButtonState();
}

class _ProfileButtonState extends State<ProfileButton> {
  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Initicon(
        backgroundColor: Color.fromARGB(255, 104, 113, 213),
        text: "Default",
      )
    ]);
  }
}
