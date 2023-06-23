import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/widgets/stepper.dart';

class BlogArticle extends StatefulWidget {
  const BlogArticle({super.key});

  @override
  State<BlogArticle> createState() => _BlogArticleState();
}

class _BlogArticleState extends State<BlogArticle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 20,
          ),
          RichText(
            text: TextSpan(
              text: 'Documents ',
              style: TextStyle(
                color: Colors.black,
              ),
              children: const <TextSpan>[
                TextSpan(text: ' / '),
                TextSpan(
                    text: ' Untitled',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black)),
              ],
            ),
          ),
          Expanded(child: Steppers())
        ]),
      ),
    ));
  }
}
