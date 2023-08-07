import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templateLibraryScreen.dart';
import 'package:hypotenuse/screen/templates/ads&social/instagram_captions.dart';
import 'package:hypotenuse/screen/templates/ads&social/linkedin_post.dart';
import 'package:hypotenuse/screen/templates/ads&social/youtube_titles_descriptions.dart';
import 'package:hypotenuse/screen/templates/general/marketing_angles.dart';
import 'package:hypotenuse/screen/templates/general/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/email_copy.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 820,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 232, 231, 239)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Most Popular',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'These are the most popular tools and a good place to start. Give them a try!',
                        style: TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TemplateLibraryScreen()),
                      );
                    },
                    child: Text('Explore all'))
              ]),
              SizedBox(
                height: 5,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 3),
                  leading: SvgPicture.asset(
                      'assets/images/icons/blogArticlePurple.svg',
                      height: 35),
                  title: Text("Blog Post",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: Text(
                      'Write an article from start to finish with a guided workflow'),
                  tileColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RewriteContent()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/rewriteContents.svg',
                        height: 35),
                    title: Text("Rewrite Content",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Refresh and repurpose content while making it more engaging and effective'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EmailCopyScreen()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/emailCopy.svg',
                        height: 35),
                    title: Text("Email Copy",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Write copy to get your message across, no matter how crowded the inbox.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => InstagramCaptions()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/instagramCaptions.svg',
                        height: 35),
                    title: Text("Instagram Captions",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Write scroll-stopping captions that encourages people to stop, look, and like.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MarketingAngles()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/marketingAngles.svg',
                        height: 35),
                    title: Text("Marketing Angles",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Generate marketing angles that are persuasive and compelling.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  visualDensity: VisualDensity(vertical: 3),
                  leading: SvgPicture.asset(
                      'assets/images/icons/pressReleases.svg',
                      height: 35),
                  title: Text("Press Releases",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: Text(
                      'Write press releases that are newsworthy and engaging.'),
                  tileColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LinkedinPostScreen()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/linkedinPost.svg',
                        height: 35),
                    title: Text("Linkedin Post",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Engage your target audience with thought-provoking and persuasive content.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YoutubeTitlesDescriptions()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: 3),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                          'assets/images/icons/youtubeTitles.svg',
                          height: 30),
                    ),
                    title: Text("Youtube Titles and Descriptions",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: Text(
                        'Optimize your videos for greater visibility and higher engagement.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}
