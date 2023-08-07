import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OutputDropdownButtons extends StatefulWidget {
  const OutputDropdownButtons({super.key});

  @override
  State<OutputDropdownButtons> createState() => _OutputDropdownButtonsState();
}

class _OutputDropdownButtonsState extends State<OutputDropdownButtons> {
  List<dynamic> _items = [
    'Bulgarian',
    'Chinese(Simplified)',
    'Chinese(Traditional)',
    'Czech',
    'Danish',
    'Dutch',
    'English ("UK")',
    'English("US")',
    'Estonian',
    'Finnish',
    'French',
    'German',
    'Greek',
    'Hungarian',
    'Indonesian',
    'Italian',
    'Japanese',
    'Korean',
    'Latvian',
    'Lithuanian',
    'Malay',
    'Myanmar(Burmese)',
    'Norwegian',
    'Polish',
    'Portuguese',
    'Portuguese (Brazilian)',
    'Romanian',
    'Russian',
    'Slovak',
    'Slovenian',
    'Spanish',
    'Swedish',
    'Tagalog(Filipino)',
    'Tamil',
    'Thai',
    'Turkish',
    'Ukrainian',
  ];
  String currentItem = "English";
  @override
  void initState() {
    currentItem = _items[7];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      width: double.infinity,
      height: 50,
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            isExpanded: true,
            alignment: Alignment.topCenter,
            borderRadius: BorderRadius.circular(8),
            value: currentItem,
            items: _items
                .map<DropdownMenuItem<String>>(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(e),
                    alignment: Alignment.centerLeft,
                  ),
                )
                .toList(),
            onChanged: (String? value) => setState(
              () {
                if (value != null) currentItem = value;
              },
            ),
          ),
        ),
      ),
    );
  }
}
