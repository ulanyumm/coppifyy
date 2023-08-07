import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/templates/workflows/blog_screen.dart';
import 'package:hypotenuse/widgets/stepper.dart';
import 'package:hypotenuse/widgets/trialCard.dart';
import 'package:hypotenuse/widgets/unlockCard.dart';

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
          Expanded(child: BlogScreens())
        ]),
      ),
    ));
  }
}
