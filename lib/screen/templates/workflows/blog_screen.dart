import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BlogScreens extends StatefulWidget {
  const BlogScreens({super.key});

  @override
  State<BlogScreens> createState() => _BlogScreensState();
}

class _BlogScreensState extends State<BlogScreens> {
  List<Step> getSteps() => [
        Step(
          title: Text('1'),
          content: Text('Content 1'),
        ),
        Step(
          title: Text('2'),
          content: Text('Content 1'),
        ),
        Step(
          title: Text(''),
          content: Text('Content 1'),
        ),
      ];
  @override
  Widget build(BuildContext context) {
    return Stepper(type: StepperType.vertical, steps: getSteps());
  }
}
