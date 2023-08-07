import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FrequentlyAskedQuestions extends StatelessWidget {
  const FrequentlyAskedQuestions({
    super.key,
    required this.selectedDrafts,
  });

  final bool selectedDrafts;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      color: Colors.white,
      width: double.infinity,
      height: selectedDrafts ? MediaQuery.of(context).size.height * 0.3 : 0,
      duration: const Duration(milliseconds: 300),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              'Credits allow you to generate content for a content type: blog posts or product descriptions (i.e. clicking the "Generate" button once).The number of credits charged depends on the content type:Product descriptions cost 1 credit Blog posts cost between 1-8 credits, depending on the number of paragraphs For commonly used content types, we’ve made them free for youProduct descriptions cost 1 credit Blog posts cost between 1-8 credits, depending on the number of paragraphs')
        ],
      ),
    );
  }
}
