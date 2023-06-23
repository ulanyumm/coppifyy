import 'package:flutter/material.dart';

class TrialCard extends StatelessWidget {
  const TrialCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        width: double.infinity,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.blueAccent),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(children: [
                Icon(
                  Icons.timer,
                  color: Color.fromARGB(255, 76, 97, 220),
                ),
                Text('Your trial has limited credits and \n ends in 1 day',
                    style: TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 76, 97, 220))),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 35,
                right: 20,
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'To continune generating content,\n subscribe to plan.',
                      style: TextStyle(
                        color: Color.fromARGB(255, 76, 97, 220),
                        fontSize: 15,
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
                      onPressed: null, child: Text('Upgrade now'))),
            )
          ],
        ));
  }
}
