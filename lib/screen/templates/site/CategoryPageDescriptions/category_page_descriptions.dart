import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/CategoryPageDescriptions/categoryPage_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class CategoryPageDescriptions extends StatefulWidget {
  const CategoryPageDescriptions({super.key});

  @override
  State<CategoryPageDescriptions> createState() =>
      _CategoryPageDescriptionsState();
}

class _CategoryPageDescriptionsState extends State<CategoryPageDescriptions> {
  CategoryPageViewModel vModel = CategoryPageViewModel();
  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CategoryPageViewModel>(context);
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
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Category page descriptions',
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                      "Optimize your category pages with descriptions that increase organic traffic.",
                      style: UIHelper.getIcerikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Category *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.categoryPagePostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: UIHelper.textfieldYukseklik(),
                          child: TextFormField(
                            onTapOutside: ((event) {
                              FocusScope.of(context).unfocus();
                            }),
                            controller:
                                viewModel.categoryPageCategoryController,
                            autofocus: false,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.009,
                              ),
                              hintText: 'floaty floral blue maxi dress',
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
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text('Keywords *',
                            style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.048,
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.009,
                              ),
                              border: const OutlineInputBorder(),
                              hintText:
                                  'write long-form content, bulk content, personalized',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  final instaViewModel =
                                      Provider.of<CategoryPageViewModel>(
                                          context,
                                          listen: false);
                                  if (viewModel.categoryPageKeywordsController
                                      .text.isNotEmpty) {
                                    instaViewModel.addItemToList(
                                        viewModel.categoryPageKeywordsController
                                            .text,
                                        context);
                                    viewModel.categoryPageKeywordsController
                                        .text = "";
                                  } else {
                                    Provider.of<CategoryPageViewModel>(context,
                                            listen: false)
                                        .checkAvailable(false);
                                    viewModel.categoryPageKeywordsController
                                        .text = "";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Değer giriniz"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            controller:
                                viewModel.categoryPageKeywordsController,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children: Provider.of<CategoryPageViewModel>(context)
                              .categoryPageKeywordsList
                              .map((interest) {
                            return Chip(
                                label: Text(interest),
                                onDeleted: () {
                                  Provider.of<CategoryPageViewModel>(context,
                                          listen: false)
                                      .removeInterest(interest);
                                });
                          }).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(height: 5),
                        Consumer<CategoryPageViewModel>(
                            builder: (context, viewModel, child) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: DropdownButton(
                                focusColor: Colors.grey,
                                elevation: 0,
                                underline: Container(),
                                isExpanded: true,
                                value: viewModel.selectedTone,
                                onChanged: (value) {
                                  Provider.of<CategoryPageViewModel>(context,
                                          listen: false)
                                      .categoryPageTone(value.toString());
                                },
                                items: viewModel.categoryPageToneMap.keys
                                    .map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(itemone),
                                      ));
                                }).toList(),
                              ));
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Provider.of<CategoryPageViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                child:
                                    const Text('More options', style: TextStyle())),
                            IconButton(
                              onPressed: () {
                                Provider.of<CategoryPageViewModel>(context,
                                        listen: false)
                                    .animateContainer(context);
                              },
                              icon: Provider.of<CategoryPageViewModel>(context,
                                          listen: false)
                                      .selectedDrafts
                                  ? const Icon(Icons.keyboard_arrow_down)
                                  : const Icon(Icons.keyboard_arrow_up),
                            ),
                          ],
                        ),
                        AnimatedContainer(
                          color: Colors.white,
                          width: double.infinity,
                          height: Provider.of<CategoryPageViewModel>(context,
                                      listen: false)
                                  .selectedDrafts
                              ? MediaQuery.of(context).size.height * 0.18
                              : 0,
                          duration: const Duration(milliseconds: 300),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Target Audience',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller:
                                      viewModel.categoryPageTargetAudience,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.009,
                                    ),
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: const TextStyle(fontSize: 13),
                                    hintText: 'spring wedding guests',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Company name',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: viewModel.categoryPageCompanyName,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.009,
                                    ),
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: const TextStyle(fontSize: 13),
                                    hintText: '',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIHelper.activeButtonColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: viewModel.categoryPageCategoryController
                                        .text.isNotEmpty &&
                                    Provider.of<CategoryPageViewModel>(context)
                                        .categoryPageKeywordsList
                                        .isNotEmpty
                                ? () {
                                    //Post işlemleri
                                    Provider.of<CategoryPageViewModel>(
                                            context,
                                            listen: false)
                                        .postTransactions(
                                            category: viewModel
                                                .categoryPageCategoryController
                                                .text,
                                            keywords:
                                                viewModel
                                                    .categoryPageKeywordsList
                                                    .toString(),
                                            toneId: viewModel.selectedToneId,
                                            audience: viewModel
                                                .categoryPageTargetAudience
                                                .text,
                                            companyName: viewModel
                                                .categoryPageCompanyName.text);
                                  }
                                : null,
                            child: Selector<CategoryPageViewModel, bool>(
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
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Consumer<CategoryPageViewModel>(
                    builder: (context, state, child) {
                      return viewModel.totalList.isNotEmpty
                          ? SizedBox(
                              height: 500,
                              child: ListView.builder(
                                  itemCount: viewModel.totalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: MultiAnsverScreen(
                                          contents: viewModel.totalList[index]
                                              .toString(),
                                          named: "Category Page Description",
                                          onDismiss: () {
                                            viewModel.removeWidgetIndex(index);
                                          },
                                          id: index,
                                        ));
                                  }),
                            )
                          : const NoContent();
                    },
                  ),
                ]))));
  }
}
