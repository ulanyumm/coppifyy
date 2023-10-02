import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/degiskenler.dart';

class WorkflowsTab extends StatefulWidget {
  const WorkflowsTab({
    super.key,
  });

  @override
  State<WorkflowsTab> createState() => _WorkflowsTabState();
}

class _WorkflowsTabState extends State<WorkflowsTab> {
  Color backColor = const Color.fromARGB(255, 234, 234, 254);

  bool _isPressed1 = false;
  bool _isPressed2 = false;
  bool _isPressed3 = false;
  bool _isPressed4 = false;
  bool _isPressed5 = false;
  void _onPressed1() {
    setState(() {
      _isPressed1 = true;
      _isPressed2 = false;
      _isPressed3 = false;
      _isPressed4 = false;
      _isPressed5 = false;
    });
  }

  void _onPressed2() {
    setState(() {
      _isPressed1 = false;
      _isPressed2 = true;
      _isPressed3 = false;
      _isPressed4 = false;
      _isPressed5 = false;
    });
  }

  void _onPressed3() {
    setState(() {
      _isPressed1 = false;
      _isPressed2 = false;
      _isPressed3 = true;
      _isPressed4 = false;
      _isPressed5 = false;
    });
  }

  void _onPressed4() {
    setState(() {
      _isPressed1 = false;
      _isPressed2 = false;
      _isPressed3 = false;
      _isPressed4 = true;
      _isPressed5 = false;
    });
  }

  void _onPressed5() {
    setState(() {
      _isPressed1 = false;
      _isPressed2 = false;
      _isPressed3 = false;
      _isPressed4 = false;
      _isPressed5 = true;
    });
  }

  final ScrollController _scrollController = ScrollController();

  void _scrollToIndex(int index) {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        index * 100.0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: _isPressed1 ? backColor : Colors.transparent,
            elevation: 0,
          ),
          onPressed: () {
            _onPressed1();
          },
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Sabitler.titles[0],
                style: const TextStyle(
                    fontSize: 14, color: Color.fromARGB(255, 55, 40, 248)),
              ),
              const SizedBox(
                width: 5,
              ),
              SvgPicture.asset(
                'assets/images/icons/workflowss.svg',
              ),
            ],
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
          onPressed: () {
            _onPressed2();
          },
          style: TextButton.styleFrom(
            backgroundColor: _isPressed2 ? backColor : Colors.transparent,
            elevation: 0,
          ),
          child: Text(
            Sabitler.titles[1],
            style: const TextStyle(
                fontSize: 14, color: Color.fromARGB(255, 55, 40, 248)),
          ),
        ),
        const SizedBox(width: 10),
        TextButton(
            onPressed: () {
              _onPressed3();
            },
            style: TextButton.styleFrom(
              backgroundColor: _isPressed3 ? backColor : Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              Sabitler.titles[2],
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 55, 40, 248)),
            )),
        const SizedBox(width: 10),
        TextButton(
            onPressed: () {
              _onPressed4();
            },
            style: TextButton.styleFrom(
              backgroundColor: _isPressed4 ? backColor : Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              Sabitler.titles[3],
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 55, 40, 248)),
            )),
        const SizedBox(width: 10),
        TextButton(
            onPressed: () {
              _onPressed5();
            },
            style: TextButton.styleFrom(
              backgroundColor: _isPressed5 ? backColor : Colors.transparent,
              elevation: 0,
            ),
            child: Text(
              Sabitler.titles[4],
              style: const TextStyle(
                  fontSize: 14, color: Color.fromARGB(255, 55, 40, 248)),
            )),
      ]),
    );
  }
}
