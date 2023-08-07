import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/contest_giveway.dart';
import 'package:hypotenuse/screen/templates/ads&social/facebook_ads.dart';
import 'package:hypotenuse/screen/templates/ads&social/linkedin_post.dart';
import 'package:hypotenuse/screen/templates/ads&social/twitter_screen.dart';
import 'package:hypotenuse/screen/templates/ads&social/video_timeline_tool.dart';
import 'package:hypotenuse/screen/templates/ads&social/youtube_titles_descriptions.dart';
import 'package:hypotenuse/screen/templates/general/askAiAnything.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/email_copy.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/event_promotion_email.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/press_releases.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/welcomming_confirmation_email.dart';
import 'package:hypotenuse/screen/templates/site/bio_writer.dart';
import 'package:hypotenuse/screen/templates/site/category_page_descriptions.dart';
import 'package:hypotenuse/screen/templates/site/landing_page_content.dart';
import 'package:hypotenuse/screen/templates/site/meta_titles_descriptions.dart';
import 'package:hypotenuse/screen/templates/site/website_headlines_slogans.dart';
import 'package:hypotenuse/screen/templates/workflows/blogArticleScreen.dart';
import 'package:hypotenuse/screen/templates/ads&social/google_ads.dart';
import 'package:hypotenuse/screen/templates/ads&social/instagram_captions.dart';
import 'package:hypotenuse/screen/templates/ads&social/video_hook_introduction.dart';
import 'package:hypotenuse/screen/templates/general/blog_ideas.dart';
import 'package:hypotenuse/screen/templates/general/ecommerce_product.dart';
import 'package:hypotenuse/screen/templates/general/job_advertisement.dart';
import 'package:hypotenuse/screen/templates/general/marketing_angles.dart';
import 'package:hypotenuse/screen/templates/general/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/general/summarizeContent.dart';
import 'package:hypotenuse/screen/templates/general/value_proposition.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/searchBar.dart';
import 'package:hypotenuse/widgets/workFlows.dart';
import 'templates/ads&social/discount_special_offer.dart';

class TemplateLibraryScreen extends StatefulWidget {
  const TemplateLibraryScreen({super.key});

  @override
  State<TemplateLibraryScreen> createState() => _TemplateLibraryScreenState();
}

class _TemplateLibraryScreenState extends State<TemplateLibraryScreen> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

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
      key: _scaffoldKey,
      drawer: DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
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
              ],
          body: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 20,
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
                    height: 5,
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
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 48,
                                        child: SvgPicture.asset(
                                          'assets/images/icons/blogArticlePurple.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Blog Article',
                                        style: UIHelper.getBaslikTextStyle(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                    'Write an article, from title to outline to article, using smart AI tools to research and edit',
                                    style: TextStyle(fontSize: 13.5)),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 5,
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
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 48,
                                        child: SvgPicture.asset(
                                          'assets/images/icons/articleGeneratorPurple.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Article Generator',
                                        style: UIHelper.getBaslikTextStyle(),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                    'Turn a title and an outline into a fully SEO-optimized and long article with this AI editor.',
                                    style: TextStyle(fontSize: 13.5)),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SizedBox(
                    height: 5,
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
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            children: [
                              Container(
                                width: 80,
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 48,
                                        width: 48,
                                        child: SvgPicture.asset(
                                          'assets/images/icons/CopiMagePurple.svg',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'CopiMage',
                                        style: UIHelper.getBaslikTextStyle(),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                    ]),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                    'Generate professional quality images from text for your website or blog.',
                                    style: TextStyle(fontSize: 13.5)),
                              ),
                            ],
                          ),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AskAIAnyThing()));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      child: SvgPicture.asset(
                                        'assets/images/icons/askAiAnything.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Ask AI Anything',
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Instruct our AI, from answering questions to writing custom content for any project.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const RewriteContent()));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      child: SvgPicture.asset(
                                        'assets/images/icons/rewriteContents.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Rewrite Content',
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Refresh and repurpose content while making it more engaging and effective.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SummarizeContent()));
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                        child: Row(
                          children: [
                            Container(
                              width: 80,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 48,
                                      width: 48,
                                      child: SvgPicture.asset(
                                        'assets/images/icons/summarizeContent.svg',
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      'Sunmarize content',
                                      style: TextStyle(fontSize: 15),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      height: 10,
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                'Sunmarize content to extract key points and insights.',
                                style: TextStyle(fontSize: 13.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MarketingAngles()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/marketingAngles.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Marketing angles',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Generate marketing angles that are persuasive and compelling.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const JobAdvertisement();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/jobAdvertisement.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Job\nAdvertisement',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Generate marketing angles that are persuasive and compelling.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const EcommerceProduct();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      'assets/images/icons/ecommerceProductDescriptions.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Ecommerce Job Advertisement',
                                    style: TextStyle(fontSize: 14),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Write a unique, creative, and strategic description that's designed to increase sales..",
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const BlogIdeas();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/blogIdeas.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Blog Ideas',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Write a unique, creative, and strategic description that's designed to increase sales..",
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ValueProposition()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 82,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/valueProposition.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Value Proposition',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Refresh and repurpose content while making it more engaging an effective.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const InstagramCaptions()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      'assets/images/icons/instagramCaptions.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Instagram captions',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Write scroll-stopping captions that envcourages people to stop, look and like.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GoogleAdsScreen()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      'assets/images/icons/googleAds.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Google Ads',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Create effective and persuasive generate leads and sales.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const FacebookAdsScreen();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      'assets/images/icons/facebookAds.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Facebook ads',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Craft powerful and compelling ads that speak to your target market.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const LinkedinPostScreen();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/linkedinPost.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Linkedn post',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Engagae your target audience with thought-provoking and persuasive content.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return const YoutubeTitlesDescriptions();
                      }));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 234, 234, 254),
                                    ),
                                    child: SvgPicture.asset(
                                      'assets/images/icons/youtubeTitles.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    'Youtube titles and descriptions',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Optimize your videos for greater visibility and higher engagement.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const VideoHookIntroduction()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/videoHookIntroduction.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Video hook and introduction',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Write a catchy and intriguing hook to reel viewers in and keep them watching.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ContestGiveway()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 90,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/contstGiveway.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Contest and Giveaway',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Create captivating content and run engaging contests and giveaways.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const DiscountSpecialOffer()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/discountOffer.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Discount Special Offer Generator',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Have something special to offer your customers? Use social media to spread the',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const TwitterScreen()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: Image.asset(
                                      'assets/images/icons/twitterPost.png',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Twitter Post',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Engage your target audience with thought-provoking and persuasive content.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VideoTimelineTool()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/videoTimelineTool.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Video Timeline Tool',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'An AI tool that allows you to create a second-by-second timeline for your videos.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WebsiteHeadlinesSlogans()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 10, 10, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 110,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/websiteHeadlines.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Website headlines and slogans',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Develop headlines and taglines that pack a punch and convert visitors into customers .',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const LandingPageContent()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/landingPageContent.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Landing page content',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Create benefit-focused landing pages that entice visitors to take the next step.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const MetaTitlesDescriptions()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/metaTitles.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Meta titles and descriptions',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Write meta titles and descriptions that are optimized for search engines.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const CategoryPageDescriptions()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/categoryPage.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Category page descriptions',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Optimize your category pages with descriptions that increase organic traffic.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BioWriters()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/bioWriter.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Bio writer',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Elevate any page with a well-written bio that will make people want to know more.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const PressReleasesScreen()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/pressReleases.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Press releases',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'Write press releases that are newsworthy and engaging.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const EmailCopyScreen()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 80,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/emailCopy.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    'Email copy',
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              'write to get your message across, no matter how crowded the inbox.',
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const EventPromotionEmail()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/emailCopy.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    "Event Promotion email",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "An intriguing event promotion email generator. For AI",
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const WelcomingConfirmationEmail()));
                    },
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 48,
                                    width: 48,
                                    child: SvgPicture.asset(
                                      'assets/images/icons/emailCopy.svg',
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(
                                    "Welcomming Confirmation Email",
                                    style: TextStyle(fontSize: 15),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ]),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Text(
                              "Create the initial email that you send out to new subscribers, customers, or users.",
                              style: TextStyle(fontSize: 13.5),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
