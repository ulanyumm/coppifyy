import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/MetaTitlesDescriptions/metatitles_viewmolde.dart';
import 'package:hypotenuse/widgets/answers/totalAnswer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class MetaTitlesDescriptions extends StatefulWidget {
  const MetaTitlesDescriptions({super.key});

  @override
  State<MetaTitlesDescriptions> createState() => _MetaTitlesDescriptionsState();
}

class _MetaTitlesDescriptionsState extends State<MetaTitlesDescriptions> {
  MetaTitlesPostViewModel vModel = MetaTitlesPostViewModel();
  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<MetaTitlesPostViewModel>(context);
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
                  Text('Meta titles and descriptions',
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Write meta titles and descriptions that are optimized for search engines.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Describe your product or service *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.metaTitlesPostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: UIHelper.textfieldYukseklik(),
                          child: TextFormField(
                            onTapOutside: ((event) {
                              FocusScope.of(context).unfocus();
                            }),
                            maxLength: 800,
                            controller: viewModel.metaTitlesProduct,
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
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text('Unique features *',
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
                                  final metaTitlesViewModel =
                                      Provider.of<MetaTitlesPostViewModel>(
                                          context,
                                          listen: false);
                                  if (viewModel
                                      .metaTitlesKeywords.text.isNotEmpty) {
                                    metaTitlesViewModel.addItemToList(
                                        viewModel.metaTitlesKeywords.text,
                                        context);
                                    viewModel.metaTitlesKeywords.text = "";
                                  } else {
                                    Provider.of<MetaTitlesPostViewModel>(
                                            context,
                                            listen: false)
                                        .checkAvailable(false);
                                    viewModel.metaTitlesKeywords.text = "";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Değer giriniz"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            controller: viewModel.metaTitlesKeywords,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children:
                              Provider.of<MetaTitlesPostViewModel>(context)
                                  .metaTitlesKeywordsList
                                  .map((interest) {
                            return Chip(
                              label: Text(interest),
                              onDeleted: () {
                                Provider.of<MetaTitlesPostViewModel>(context,
                                        listen: false)
                                    .metaTitlesKeywordsList
                                    .remove(interest);
                              },
                            );
                          }).toList(),
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
                            onPressed: viewModel
                                        .metaTitlesProduct.text.isNotEmpty &&
                                    Provider.of<MetaTitlesPostViewModel>(
                                            context)
                                        .metaTitlesKeywordsList
                                        .isNotEmpty
                                ? () {
                                    Provider.of<MetaTitlesPostViewModel>(
                                            context,
                                            listen: false)
                                        .postTransactions(
                                      product: viewModel.metaTitlesProduct.text,
                                      keywords: viewModel.metaTitlesKeywordsList
                                          .toString(),
                                    );
                                  }
                                : null,
                            child: Selector<MetaTitlesPostViewModel, bool>(
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
                  Consumer<MetaTitlesPostViewModel>(
                    builder: (context, state, child) {
                      return viewModel.totalList.isNotEmpty
                          ? SizedBox(
                              height: 500,
                              child: ListView.builder(
                                itemCount: viewModel.totalList.length,
                                physics: const ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: TotalAnswer(
                                        contents: viewModel
                                            .totalList[index].description!,
                                        title: viewModel
                                            .totalList[index].metaTitle!,
                                        id: index,
                                        onDismiss: () {
                                          viewModel.removeWidgetIndex(
                                            index,
                                          );
                                        },
                                      ));
                                },
                              ),
                            )
                          : const NoContent();
                    },
                  ),
                ]))));
  }
}
