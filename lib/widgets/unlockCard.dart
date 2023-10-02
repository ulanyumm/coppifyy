import 'package:flutter/material.dart';

class UnlockCard extends StatelessWidget {
  const UnlockCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(
                  Icons.bolt_outlined,
                  color: Color.fromARGB(255, 76, 97, 220),
                ),
                Text('Speed up your writing with AI',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 76, 97, 220))),
              ]),
            ),
            const Padding(
              padding: EdgeInsets.only(
                left: 35,
                right: 20,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Text(
                      'Subscribe to a plan to get creditds \nand continue generating content \nwith AI.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 76, 97, 220),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 35, right: 20),
                child: SizedBox(
                    height: 35,
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 216, 211, 211),
                        ),
                        onPressed: () {},
                        child: const Text('Upgrade now',
                            style: TextStyle(color: Colors.indigo)))))
          ],
        ));
  }
}
