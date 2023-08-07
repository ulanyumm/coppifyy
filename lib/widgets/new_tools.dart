import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templates/ads&social/instagram_captions.dart';
import 'package:hypotenuse/screen/templates/general/rewriteContent.dart';
import 'package:hypotenuse/screen/templates/newsletter_commons/email_copy.dart';

class NewTools extends StatelessWidget {
  const NewTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 167, 178, 236)),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              SizedBox(
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
                    child: Center(
                        child: Text('New',
                            style: TextStyle(color: Colors.white)))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Text(
                    'Check out these new tools Copify has to offer!',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ]),
              SizedBox(
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
            ],
          ),
        ));
  }
}
