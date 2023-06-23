import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownButtons extends StatefulWidget {
  const DropdownButtons({super.key});

  @override
  State<DropdownButtons> createState() => _DropdownButtonsState();
}

class _DropdownButtonsState extends State<DropdownButtons> {
  List<dynamic> _items = [
    'Personal',
    'Small team',
    'Agency',
    'Education',
    'Large company',
    'Others'
  ];
  String currentItem = "Chose your role *";
  @override
  void initState() {
    currentItem = _items[0];
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
