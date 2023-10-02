import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/email_copy.dart';

import '../screen/templates/ads&social/InstagramCaptions/instagram_captions.dart';

class NewTools extends StatelessWidget {
  const NewTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: const Color.fromARGB(255, 167, 178, 236)),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(
                    width: 60,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                        child: Text('New',
                            style: TextStyle(color: Colors.white)))),
                const SizedBox(
                  width: 10,
                ),
                const Expanded(
                  child: Text(
                    'Check out these new tools Copify has to offer!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              GestureDetector(
                onTap: () {},
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: ListTile(
                    visualDensity: const VisualDensity(vertical: 3),
                    leading: SvgPicture.asset(
                        'assets/images/icons/blogArticlePurple.svg',
                        height: 35),
                    title: const Text("Blog Post",
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    subtitle: const Text(
                        'Write an article from start to finish with a guided workflow'),
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
            ],
          ),
        ));
  }
}
