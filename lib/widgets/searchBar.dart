import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 35,
      child: TextField(
        cursorColor: Colors.grey,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(width: 0.2, color: Colors.grey),
            ),
            hintText: 'Search templates',
            hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
            prefixIcon: Icon(
              Icons.search,
            )),
      ),
    );
  }
}
