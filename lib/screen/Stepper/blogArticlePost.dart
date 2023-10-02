/* import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/Stepper/blogArticlePage2.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticlePost_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

class BlogArticlePost extends StatefulWidget {
  const BlogArticlePost({
    super.key,
  });

  @override
  State<BlogArticlePost> createState() => _BlogArticlePostState();
}

class _BlogArticlePostState extends State<BlogArticlePost> {
  BlogArticleProjectViewModel viewModel = BlogArticleProjectViewModel();
  @override
  Widget build(BuildContext context) {
    var proViewModel = Provider.of<BlogArticleProjectViewModel>(context);

    return Scaffold(
        key: viewModel.page1scaffoldkey,
        drawer: const DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            viewModel.scaffoldKey.currentState!.openDrawer();
          },
          child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: // ComingSoon()

            Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Blog Article', style: UIHelper.getBaslikTextStyle()),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text('Describe your topic *',
                  style: UIHelper.getBaslikTextStyle()),
              const SizedBox(height: 5),
              TextFormField(
                maxLength: 800,
                controller: proViewModel.describleTopicController,
                autofocus: false,
                minLines: 5,
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.all(10),
                  filled: true,
                  fillColor: UIHelper.fillColor(),
                  labelStyle: const TextStyle(fontSize: 13),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.multiline,
                maxLines: null,
              ),
              Text('Keywords *', style: UIHelper.getBaslikTextStyle()),
              const SizedBox(height: 5),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
                child: TextField(
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.add_circle_outline),
                      onPressed: () {
                        final blogViewModel =
                            Provider.of<BlogArticleProjectViewModel>(context,
                                listen: false);
                        if (viewModel.keywordsController.text.isNotEmpty) {
                          blogViewModel.addItemToList(
                              viewModel.keywordsController.text, context);
                          viewModel.keywordsController.text = "";
                        } else {
                          Provider.of<BlogArticleProjectViewModel>(context,
                                  listen: false)
                              .checkAvailable(false);
                          viewModel.keywordsController.text = "";
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Değer giriniz"),
                            ),
                          );
                        }
                        Provider.of<BlogArticleProjectViewModel>(context,
                                listen: false)
                            .isButtonActiveFunc();
                      },
                    ),
                  ),
                  controller: viewModel.keywordsController,
                ),
              ),
              Wrap(
                spacing: 8,
                children: Provider.of<BlogArticleProjectViewModel>(context)
                    .keywordsList
                    .map((item) {
                  return Chip(
                    label: Text(item),
                    onDeleted: () {
                      Provider.of<BlogArticleProjectViewModel>(context,
                              listen: false)
                          .removeInterest(item);
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text('Tone *', style: UIHelper.getBaslikTextStyle()),
              const SizedBox(height: 5),
              Consumer<BlogArticleProjectViewModel>(
                  builder: (context, viewModel, child) {
                return Container(
                    height: MediaQuery.of(context).size.height * 0.04,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      focusColor: Colors.grey,
                      elevation: 0,
                      underline: Container(),
                      isExpanded: true,
                      value: Provider.of<BlogArticleProjectViewModel>(context,
                              listen: false)
                          .selectedTone,
                      onChanged: (value) {
                        Provider.of<BlogArticleProjectViewModel>(context,
                                listen: false)
                            .selectToneFunc(value.toString());
                      },
                      items: viewModel.toneMap.keys.map((itemone) {
                        return DropdownMenuItem(
                            value: itemone,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 20.0),
                              child: Text(itemone),
                            ));
                      }).toList(),
                    ));
              }),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Provider.of<BlogArticleProjectViewModel>(context,
                              listen: false)
                          .animateContainer(context);
                    },
                    child: Text('More options',
                        style: UIHelper.getBaslikTextStyle()),
                  ),
                  IconButton(
                    onPressed: () {
                      Provider.of<BlogArticleProjectViewModel>(context,
                              listen: false)
                          .animateContainer(context);
                    },
                    icon: Provider.of<BlogArticleProjectViewModel>(context,
                                listen: false)
                            .selectedDrafts
                        ? const Icon(Icons.keyboard_arrow_down)
                        : const Icon(Icons.keyboard_arrow_up),
                  ),
                ],
              ),
              Container(
                child: Selector<BlogArticleProjectViewModel, bool>(
                  builder: (context, selectedDrafts, child) {
                    return AnimatedContainer(
                      color: Colors.white,
                      height: Provider.of<BlogArticleProjectViewModel>(context,
                                  listen: false)
                              .selectedDrafts
                          ? MediaQuery.of(context).size.height * 0.2
                          : 0,
                      duration: const Duration(milliseconds: 300),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: ToggleButtons(
                                    isSelected: [
                                      Provider.of<BlogArticleProjectViewModel>(
                                                  context)
                                              .selectedTabIndex ==
                                          0,
                                      Provider.of<BlogArticleProjectViewModel>(
                                                  context)
                                              .selectedTabIndex ==
                                          1,
                                      Provider.of<BlogArticleProjectViewModel>(
                                                  context)
                                              .selectedTabIndex ==
                                          2,
                                    ],
                                    onPressed: (index) {
                                      Provider.of<BlogArticleProjectViewModel>(
                                              context,
                                              listen: false)
                                          .selectedTabIndex = index;

                                      Provider.of<BlogArticleProjectViewModel>(
                                              context,
                                              listen: false)
                                          .setSelectedButtons(index);
                                    },
                                    renderBorder: false,
                                    children: [
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Provider.of<BlogArticleProjectViewModel>(
                                                                context)
                                                            .selectedTabIndex ==
                                                        0
                                                    ? const Color.fromARGB(
                                                        255, 20, 10, 117)
                                                    : Colors.transparent)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text('First Person',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Provider.of<BlogArticleProjectViewModel>(
                                                                context)
                                                            .selectedTabIndex ==
                                                        1
                                                    ? const Color.fromARGB(
                                                        255, 144, 135, 229)
                                                    : Colors.transparent)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text('Second Person',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: double.infinity,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            border: Border.all(
                                                color: Provider.of<BlogArticleProjectViewModel>(
                                                                context)
                                                            .selectedTabIndex ==
                                                        2
                                                    ? const Color.fromARGB(
                                                        255, 144, 135, 229)
                                                    : Colors.transparent)),
                                        child: const Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Center(
                                            child: Text('Third Person',
                                                style: TextStyle(
                                                    color: Colors.black)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  controller: viewModel.audienceController,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: const TextStyle(fontSize: 12),
                                    hintText:
                                        'those who want to their writing skills',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  selector: (context, viewModel) => viewModel.selectedDrafts,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Selector<BlogArticleProjectViewModel, bool>(
                builder: (context, isActiveButton, child) {
                  return SizedBox(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.035,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: UIHelper.activeButtonColor(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8))),
                        onPressed: Provider.of<BlogArticleProjectViewModel>(
                                    context,
                                    listen: false)
                                .isActiveButton
                            ? () {
                                Provider.of<BlogArticleProjectViewModel>(
                                        context,
                                        listen: false)
                                    .postProject(
                                        topic: proViewModel
                                            .describleTopicController.text,
                                        keywords: proViewModel.keywordsList,
                                        toneId: proViewModel.selectedToneId,
                                        viewId:
                                            proViewModel.articleTabSelected);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const BlogArticleTitle()),
                                );
                              }
                            : null,
                        child: Selector<BlogArticleProjectViewModel, bool>(
                          builder: (context, isLoading, child) {
                            return isLoading
                                ? const CircularProgressIndicator()
                                : Text(
                                    'Renew Outline',
                                    style: UIHelper.getButtonTextStyle(),
                                  );
                          },
                          selector: (context, state) => state.isLoading,
                        ),
                      ));
                },
                selector: (context, state) => state.isActiveButton,
              ),
              //  NoContent(),
            ]),
          ),
        ));
  }
}
 */