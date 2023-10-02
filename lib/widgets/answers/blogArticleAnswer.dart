import 'package:flutter/material.dart';

class BlogarticleAnswer extends StatefulWidget {
  BlogarticleAnswer({
    Key? key,
    required this.title,
    this.introduction,
    required this.outline,
    required this.content,
    this.conclusion,
  }) : super(key: key);
  String title;
  String? introduction;
  List<String> outline = [];
  String content;
  String? conclusion;
  @override
  State<BlogarticleAnswer> createState() => _BlogarticleAnswerState();
}

class _BlogarticleAnswerState extends State<BlogarticleAnswer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [TextFormField()],
      ),
    );
  }
}
