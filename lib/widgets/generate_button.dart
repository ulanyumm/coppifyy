import 'package:flutter/material.dart';
import 'package:hypotenuse/constants/ui_helper.dart';

class GenerateButton extends StatelessWidget {
  const GenerateButton({
    super.key,
    required TextEditingController keywordsController,
    required TextEditingController topicController,
  }) : _keywordsController = keywordsController, _topicController = topicController;

  final TextEditingController _keywordsController;
  final TextEditingController _topicController;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context)
                .size
                .height *
            0.035,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(
                  8),
        ),
        child: ElevatedButton(
            style: ElevatedButton
                .styleFrom(
              backgroundColor: _keywordsController
                          .text
                          .isEmpty &&
                      _topicController
                          .text
                          .isEmpty
                  ? UIHelper
                      .passiveButtonColor()
                  : UIHelper
                      .activeButtonColor(),
            ),
            onPressed: _topicController
                        .text
                        .isEmpty &&
                    _keywordsController
                        .text.isEmpty
                ? null
                : () {},
            child: Text(
              'Generate',
              style: UIHelper
                  .getButtonTextStyle(),
            )));
  }
}
