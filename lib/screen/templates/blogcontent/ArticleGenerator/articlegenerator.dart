import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articleGenerator_viewmodel.dart';
import 'package:hypotenuse/widgets/answers/articleAnswer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class ArticleGenerator extends StatefulWidget {
  const ArticleGenerator({super.key});

  @override
  State<ArticleGenerator> createState() => _ArticleGeneratorState();
}

class _ArticleGeneratorState extends State<ArticleGenerator> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ArticleGeneratorViewModel>(context);
    return Scaffold(
      key: viewModel.scaffoldKey,
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
      body: //ComingSoon()

          Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Article Generator',
                  style: UIHelper.getAnaBaslikTextStyle()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.01),
              Text(
                "Turn a title and an outline into a fully SEO-optimized and long article with this AI editor.",
                style: UIHelper.getIcerikTextStyle(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Article Title *',
                style: UIHelper.getBaslikTextStyle(),
              ),
              const SizedBox(height: 5),
              Form(
                key: viewModel.articleGeneratorFormkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      maxLength: 800,
                      controller: viewModel.titleController,
                      autofocus: false,
                      minLines: 1,
                      onChanged: (value) {
                        Provider.of<ArticleGeneratorViewModel>(context,
                                listen: false)
                            .checkActiveButton(
                          Provider.of<ArticleGeneratorViewModel>(context,
                                  listen: false)
                              .titleController
                              .text,
                        );
                      },
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(8),
                        isDense: true,
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Audience ',
                      style: UIHelper.getBaslikTextStyle(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      maxLength: 800,
                      controller: viewModel.audienceController,
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: const EdgeInsets.all(7),
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
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: TextField(
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: const EdgeInsets.all(10),
                          border: const OutlineInputBorder(),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              final articleProvider =
                                  Provider.of<ArticleGeneratorViewModel>(
                                      context,
                                      listen: false);
                              if (viewModel
                                  .keywordsController.text.isNotEmpty) {
                                articleProvider.addItemToList(
                                    viewModel.keywordsController.text, context);
                                viewModel.keywordsController.text = "";
                              } else {
                                Provider.of<ArticleGeneratorViewModel>(context,
                                        listen: false)
                                    .checkAvailable(false);
                                viewModel.keywordsController.text = "";
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text("Değer giriniz"),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                        controller: viewModel.keywordsController,
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: Provider.of<ArticleGeneratorViewModel>(context)
                          .generalKeywordsList
                          .map((item) {
                        return Chip(
                          label: Text(item),
                          onDeleted: () {
                            Provider.of<ArticleGeneratorViewModel>(context,
                                    listen: false)
                                .removeInterest(item);
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Type *', style: UIHelper.getBaslikTextStyle()),
                    const SizedBox(height: 5),
                    Consumer<ArticleGeneratorViewModel>(
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
                            underline: Container(),
                            isExpanded: true,
                            value: viewModel.selectedType,
                            onChanged: (value) {
                              viewModel.setSelectedType(value.toString());
                            },
                            items: Provider.of<ArticleGeneratorViewModel>(
                                    context,
                                    listen: false)
                                .articleGeneratorTypeMap
                                .map((itemone) {
                              return DropdownMenuItem(
                                value: itemone,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(itemone),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Outline', style: UIHelper.getBaslikTextStyle()),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Directionality(
                              textDirection: TextDirection.ltr,
                              child: TextButton.icon(
                                onPressed: null,
                                icon: const Icon(
                                  CupertinoIcons.bolt,
                                  color: Color.fromARGB(255, 48, 98, 212),
                                ),
                                label: const Text(
                                  "Write the outline with AI",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 48, 98, 212)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Column(
                      children: viewModel.outlineList.map((outline) {
                        return Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(outline),
                                IconButton(
                                  onPressed: () {
                                    final articleProvider =
                                        Provider.of<ArticleGeneratorViewModel>(
                                            context,
                                            listen: false);
                                    articleProvider.removeItemOutlineList(
                                        viewModel.outlineList.indexOf(outline));
                                  },
                                  icon: const Icon(Icons.delete,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Consumer<ArticleGeneratorViewModel>(
                      builder: (context, viewModel, child) {
                        return Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.05,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText:
                                      "Add a talking point for this paragraph...",
                                  isDense: true,
                                  contentPadding: const EdgeInsets.all(10),
                                  border: const OutlineInputBorder(),
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      final newItem =
                                          viewModel.outlineListController.text;
                                      if (newItem.isNotEmpty) {
                                        Provider.of<ArticleGeneratorViewModel>(
                                          context,
                                          listen: false,
                                        ).addItemOutlineList(newItem, context);
                                        viewModel.outlineListController.text =
                                            ""; // Textfield'ı temizle
                                      } else {
                                        //hata mesajı göster
                                      }
                                    },
                                  ),
                                ),
                                controller: viewModel.outlineListController,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Row(
                      children: <Widget>[
                        const SizedBox(width: 10),
                        const Text('Introduction',
                            style: TextStyle(fontSize: 15.0)),
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                            value: viewModel.introduction,
                            onChanged: (bool? value) {
                              Provider.of<ArticleGeneratorViewModel>(
                                context,
                                listen: false,
                              ).introduction = value!;
                            },
                          ),
                        ),
                        const Text('Conclusion',
                            style: TextStyle(fontSize: 15.0)),
                        Transform.scale(
                          scale: 0.7,
                          child: Checkbox(
                            value: viewModel.conclusion,
                            onChanged: (bool? value) {
                              Provider.of<ArticleGeneratorViewModel>(
                                context,
                                listen: false,
                              ).conclusion = value!;
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Selector<ArticleGeneratorViewModel, bool>(
                builder: (context, isActiveButton, child) {
                  return SizedBox(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.035,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: UIHelper.activeButtonColor(),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: isActiveButton
                          ? () {
                              Provider.of<ArticleGeneratorViewModel>(
                                context,
                                listen: false,
                              ).postTransaction(
                                title: viewModel.titleController.text,
                                audience: viewModel.audienceController.text,
                                keywords: viewModel.generalKeywordsList,
                                outlines: viewModel.outlineList,
                                selectedType: viewModel.selectedType,
                              );
                            }
                          : null,
                      child: Selector<ArticleGeneratorViewModel, bool>(
                        builder: (context, isLoading, child) {
                          return isLoading
                              ? const CircularProgressIndicator()
                              : Text(
                                  'Generate',
                                  style: UIHelper.getButtonTextStyle(),
                                );
                        },
                        selector: (context, state) => state.isLoading,
                      ),
                    ),
                  );
                },
                selector: (context, viewModel) => viewModel.isActiveButton,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Consumer<ArticleGeneratorViewModel>(
                builder: (context, state, child) {
                  return viewModel.dataModel.data == null
                      ? const NoContent()
                      : ArticleAnsver(
                          contents: "viewModel.dataModel.data!.project",
                          named: 'Article Generator',
                        );
                  /*  if (viewModel.isDataAvailable) {
                    String? descriptionsList =
                        state.dataModel.data?.project!.createdAt;

                    if (descriptionsList == null || descriptionsList.isEmpty) {
                      return const NoContent();
                    }

                    return ArticleAnsver(
                      contents: descriptionsList,
                      named: 'Article Generator',
                    );
                  } else {
                    return const NoContent();
                  } */
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
