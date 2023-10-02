import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class Copifyer extends StatelessWidget {
  const Copifyer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                SvgPicture.asset('assets/images/icons/growth.svg', height: 30),
                const SizedBox(
                  width: 15,
                ),
                const Text(
                  'COPIFYER',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )
              ]),
              const Divider(
                thickness: 2,
              ),
              const Text(
                  "Start exploring now and find out if it's the perfect fit for you."),
              RichText(
                text: const TextSpan(
                    text: '\$19',
                    style: TextStyle(color: Colors.black, fontSize: 23),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' /month',
                        style: TextStyle(color: Colors.grey, fontSize: 18),
                      )
                    ]),
              ),
              const Text('Standart', style: TextStyle(fontSize: 18)),
              const Text.rich(TextSpan(children: [
                TextSpan(
                  text: '700',
                  style: TextStyle(color: Colors.black, fontSize: 18),
                ),
                TextSpan(
                  text: ' credits/month ',
                ),
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Write your articles with Article Writing Tools',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Text to Image Generation',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                    text:
                        'Create CEO friendly advertisement for several platforms')
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Make your videos with guidance of Video Timeline Tool',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Make your time consuming contents with ease',
                )
              ])),
              const Text.rich(TextSpan(children: [
                WidgetSpan(
                    child: Icon(Icons.check, color: Colors.indigo, size: 20)),
                TextSpan(
                  text: 'Create your content in 11 LANGUAGES',
                )
              ])),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 104, 113, 213),
                    ),
                    onPressed: () {},
                    child: const Text("Select")),
              ),
            ]),
      ),
    );
  }
}
