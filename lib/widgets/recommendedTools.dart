import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/screen/templateLibraryScreen.dart';

class RecommendedTools extends StatelessWidget {
  const RecommendedTools({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 232, 231, 239)),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              Row(children: [
                Text(
                  'Recommended tools',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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
                      'assets/images/icons/summarize-content.svg',
                      height: 35),
                  title: Text("Summarize content",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: Text('Extract key points an insights'),
                  tileColor: Colors.white,
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
                      'assets/images/icons/ask-ai-anything.svg',
                      height: 35),
                  title: Text("Ask AI anything",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: Text('Answer questions, brainstorm & more'),
                  tileColor: Colors.white,
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
                  leading: SvgPicture.asset('assets/images/icons/rewriter.svg',
                      height: 35),
                  title: Text("Rewrite content",
                      style: TextStyle(
                        fontSize: 16,
                      )),
                  subtitle: Text('Improve readability and reword content'),
                  tileColor: Colors.white,
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
