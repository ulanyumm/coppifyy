import 'package:flutter/material.dart';

class EditorTabBar extends StatefulWidget {
  const EditorTabBar({super.key});

  @override
  State<EditorTabBar> createState() => _EditorTabBarState();
}

class _EditorTabBarState extends State<EditorTabBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        initialIndex: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TabBar(
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      color: const Color.fromARGB(255, 217, 218, 219),
                    ),
                    isScrollable: true,
                    tabs: const [
                      Tab(
                          child: Text(
                        'Edit',
                        style: TextStyle(color: Colors.black),
                      )),
                      Tab(
                          child: Text(
                        'Preview',
                        style: TextStyle(color: Colors.black),
                      )),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.refresh, color: Colors.red),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Reset All',
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      Container(
                        color: const Color.fromARGB(255, 203, 199, 199),
                        width: 15,
                        child: const Center(child: Text('5')),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // EditTabBarView(),
          ],
        ),
      ),
    );
  }
}
