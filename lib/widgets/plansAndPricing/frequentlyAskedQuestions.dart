import 'package:flutter/material.dart';

class FrequentlyAskedQuestionsWidget extends StatelessWidget {
  const FrequentlyAskedQuestionsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 10,
      ),
      child: Column(
        children: <Widget>[
          ExpansionTile(
            title: const Text('What is a credit?'),
            children: <Widget>[
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Credits allow you to generate content for a content type: blog posts or product descriptions (i.e. clicking the 'Generate' button once).\n"),
                    Text(
                        "The number of credits charged depends on the content type"),
                    Text("For example:"),
                    Text("● Ask AI Anything cost 2 credit"),
                    Text(
                        "● Blog posts cost between 3-24 credits, depending on the number of paragraphs. A paragraph costs 3 credits."),
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text('Can I cancel my subscription anytime?'),
            children: <Widget>[
              Container(
                child: const Column(
                  children: [
                    Text(
                        "Absolutely. You can cancel your subscription at any time—we want you to be 100% happy with your experience! If you cancel your plan, you'll stay on that plan and have access to your account until the end of your billing cycle."),
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text(
                'What if I upgrade or downgrade my plan in the middle of my billing cycle?'),
            children: <Widget>[
              Container(
                child: const Column(
                  children: [
                    Text(
                        "If you decide to downgrade your plan, your credits will roll over to your new subscription model. You can upgrade your plan at any time."),
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text('How long are your contracts?'),
            children: <Widget>[
              Container(
                child: const Column(
                  children: [
                    Text("You can opt for a monthly or yearly subscription."),
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text('Is my remaining credits rolling over?'),
            children: <Widget>[
              Container(
                child: const Column(
                  children: [
                    Text(
                        "For example, in the Copify plan, if you've used up 160 out of 300 credits in month, then your subscription renew and your account will be rise to 440 credits. It goes as same as well with other plans."),
                  ],
                ),
              )
            ],
          ),
          ExpansionTile(
            title: const Text('What payment methods do you accept?'),
            children: <Widget>[
              Container(
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "We use Iyzico to process your payments securely. You can pay with the following payment methods:"),
                    Text(
                        "The number of credits charged depends on the content type"),
                    Text("For example:"),
                    Text("● Major credit cards including Visa, Mastercard."),
                    Text(
                        "● We only accept payments with credit card. No debit cards."),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
