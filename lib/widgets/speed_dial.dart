import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SpeedDialMenu extends StatefulWidget {
  const SpeedDialMenu({super.key});

  @override
  State<SpeedDialMenu> createState() => _SpeedDialMenuState();
}

class _SpeedDialMenuState extends State<SpeedDialMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(
            child: const Icon(Icons.copy),
            label: "Copy",
            onTap: () {
              print("Coppied");
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.delete),
            label: "Delete",
            onTap: () {
              print("Deleted");
            },
          ),
          SpeedDialChild(
            child: const Icon(Icons.share),
            label: "Share",
            onTap: () {
              print("Shared");
            },
          ),
        ],
      ),
    );
  }
}
