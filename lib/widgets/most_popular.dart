import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templateLibraryScreen.dart';
import 'package:hypotenuse/screen/templates/ads&social/InstagramCaptions/instagram_captions.dart';
import 'package:hypotenuse/screen/templates/ads&social/LinkedinPost/linkedin_post.dart';
import 'package:hypotenuse/screen/templates/ads&social/YoutubeTitlesDescriptions/youtube_titles_descriptions.dart';
import 'package:hypotenuse/screen/templates/general/MarketingAngels/marketing_angles.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/email_copy.dart';

class MostPopular extends StatelessWidget {
  const MostPopular({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 232, 231, 239)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Most Popular',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TemplateLibraryScreen()),
                      );
                    },
                    child: const Text('Explore all'))
              ]),
              const Text(
                'These are the most popular tools and a good place to start. Give them a try!',
                style: TextStyle(fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              /* Card(
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
              ), */
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RewriteContent()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/rewriteContents.svg',
                        height: 35),
                    title: const Text("Rewrite Content",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Refresh and repurpose content while making it more engaging and effective'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmailCopyScreen()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/emailCopy.svg',
                        height: 35),
                    title: const Text("Email Copy",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Write copy to get your message across, no matter how crowded the inbox.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const InstagramCaptions()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/instagramCaptions.svg',
                        height: 35),
                    title: const Text("Instagram Captions",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Write scroll-stopping captions that encourages people to stop, look, and like.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MarketingAngles()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/marketingAngles.svg',
                        height: 35),
                    title: const Text("Marketing Angles",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Generate marketing angles that are persuasive and compelling.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                clipBehavior: Clip.antiAlias,
                child: ListTile(
                  visualDensity: const VisualDensity(vertical: 3),
                  leading: SvgPicture.asset(
                      'assets/images/icons/pressReleases.svg',
                      height: 35),
                  title: const Text("Press Releases",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: const Text(
                      'Write press releases that are newsworthy and engaging.'),
                  tileColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LinkedinPostScreen()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/linkedinPost.svg',
                        height: 35),
                    title: const Text("Linkedin Post",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Engage your target audience with thought-provoking and persuasive content.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const YoutubeTitlesDescriptions()),
                  );
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: SvgPicture.asset(
                          'assets/images/icons/youtubeTitles.svg',
                          height: 30),
                    ),
                    title: const Text("Youtube Titles and Descriptions",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Optimize your videos for greater visibility and higher engagement.'),
                    tileColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ));
  }
}
