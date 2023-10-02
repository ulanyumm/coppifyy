/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/Stepper/blogArticlePage3.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticleTitle_viewModel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

class BlogArticleTitle extends StatefulWidget {
  const BlogArticleTitle({super.key});

  @override
  _BlogArticleTitleState createState() => _BlogArticleTitleState();
}

class _BlogArticleTitleState extends State<BlogArticleTitle> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<BlogArticleTitleViewModel>(context);
    return Scaffold(
      key: viewModel.page2scaffoldkey,
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          viewModel.page2scaffoldkey.currentState!.openDrawer();
        },
        child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Select and edit your generated titles',
                style: UIHelper.getBaslikTextStyle()),
            Expanded(
              child: ListView.builder(
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      decoration: BoxDecoration(
                        color: viewModel.selectedTitles
                                .contains(viewModel.articleTitleList[index])
                            ? const Color.fromARGB(255, 237, 242, 255)
                            : Colors.white,
                        border: Border.all(
                            color: const Color.fromARGB(255, 0, 0, 0),
                            width: 0.3),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CheckboxListTile(
                        controlAffinity: ListTileControlAffinity.leading,
                        side: const BorderSide(color: Colors.black),
                        title: Text(
                          viewModel.articleTitleList[index],
                          style: const TextStyle(fontSize: 13),
                        ),
                        value: Provider.of<BlogArticleTitleViewModel>(context)
                            .selectedTitles
                            .contains(viewModel.articleTitleList[index]),
                        onChanged: (bool? value) {
                          if (value == true) {
                            Provider.of<BlogArticleTitleViewModel>(context,
                                    listen: false)
                                .titleSelectionFunc(
                                    viewModel.articleTitleList[index]);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            // <-- Icon
                            Icons.arrow_back,
                            size: 20.0,
                          ),
                          Text('Back'), // <-- Text
                        ],
                      ),
                    )),
                Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: viewModel.selectedTitles.isNotEmpty
                          ? () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const BlogArticleOutline()),
                              );
                            }
                          : null,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Next'), // <-- Text
                          Icon(
                            // <-- Icon
                            Icons.arrow_forward,
                            size: 20.0,
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
 */