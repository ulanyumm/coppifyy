import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/blogArticleScreen.dart';
import 'package:hypotenuse/widgets/workFlows.dart';
import '../widgets/searchBar.dart';

class TemplateLibraryScreen extends StatefulWidget {
  const TemplateLibraryScreen({super.key});

  @override
  State<TemplateLibraryScreen> createState() => _TemplateLibraryScreenState();
}

class _TemplateLibraryScreenState extends State<TemplateLibraryScreen> {
  static final itemKey = GlobalKey();
  static Future scrollItem() async {
    final context = itemKey.currentContext!;
    await Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              automaticallyImplyLeading: false,
              title: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text('Template Library',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              bottom: PreferredSize(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        searchBar(),
                        SizedBox(
                          height: 10,
                        ),
                        WorkflowsTab(),
                      ],
                    ),
                  ),
                  preferredSize: Size.fromHeight(120))),
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text('Workflows',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BlogArticle()),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromARGB(255, 234, 234, 254),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/icons/blog_article_workflows.svg',
                                    height: 35),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Blog Article',
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    'Write an article, from title to outline to article, using smart AI tools to research and edit.',
                                    style: TextStyle(fontSize: 13.5)),
                              ]),
                        )),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Text('General',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    'Improve your writing and repurpose content easily.',
                    style: TextStyle(fontSize: 13),
                  ),
                  Divider(),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ask AI anything',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Instrut our AI, from answering questions to writing custom content for any project.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/lightbulb.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Rewrite content',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Refresh and repurpose content while making it more engaging an effective.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/rewriter_template.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Sunmarize content',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Sunmarize content to extract key points and insights.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/summarizer_template.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Marketing angles',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Generate marketing angles that are persuasive and compelling.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/marketing_angles_template.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Simplify language',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Make complex concepts easy to understand and jargon-free.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/simplify_content_template.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Ads &social',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    'Create compelling copy for your next campaign.',
                    style: TextStyle(fontSize: 13),
                  ),
                  Divider(),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Instagram captions',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Write scroll-stopping captions that envcourages people to stop, look and like.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 120,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/instagram.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Google ads',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Create effective and persuasive generate leads and sales.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/google-ads.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Facebook ads',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Craft powerful and compelling ads that speak to your target market.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/facebook.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Linkedn post',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Engagae your target audience with thought-provoking and persuasive content.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 120,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/linkedn.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Youtube titles and descriptions',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Optimize your videos for greater visibility and higher engagement.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/youtube.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Video hook and introduction',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Write a catchy and intriguing hook to reel viewers in and keep them watching.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/video.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Site',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    'Transform your websiteinto a content powerhouse.',
                    style: TextStyle(fontSize: 13),
                  ),
                  Divider(),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Website headlines and slogans',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Develop headlines and taglines that pack a punch and convert visitors into customers .',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 120,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/headlines.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Landing page content',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Create benefit-focused landing pages that entice visitors to take the next step.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/landing-page.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Meta titles and descriptions',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Write meta titles and descriptions that are optimized for search engines.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/meta-titles.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Category page descriptions',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Optimize your category pages with descriptions that increase organic traffic.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/category-pages.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Bio writer',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Elevate any page with a well-written bio that will make people want to know more.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/bio-writer.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Newsletter & comms',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                  Text(
                    'Craft effective messaging for your audience.',
                    style: TextStyle(fontSize: 13),
                  ),
                  Divider(),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Email copy',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'write to get your message across, no matter how crowded the inbox.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 120,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/email-copy.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Press releases',
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Write press releases that are newsworthy and engaging.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/press-release.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Card(
                          child: Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Can't find a content type?",
                                style: TextStyle(fontSize: 15),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Suggest what we should add next. We'll send our AI back to school to learn it!.",
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ]),
                      )),
                      Positioned(
                          bottom: 105,
                          right: 260,
                          child: SvgPicture.asset(
                              'assets/images/icons/default-template.svg',
                              height: 35)),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
