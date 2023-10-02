import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googleAds_viewmodel.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googleAds/googleadsPreview.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googleAds/googleads_answer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class GoogleAdsScreen extends StatefulWidget {
  const GoogleAdsScreen({super.key});

  @override
  State<GoogleAdsScreen> createState() => _GoogleAdsScreenState();
}

class _GoogleAdsScreenState extends State<GoogleAdsScreen> {
  GoogleAdsViewModel vModel = GoogleAdsViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<GoogleAdsViewModel>(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          key: viewModel.scaffoldKey,
          drawer: const DrawerMenu(),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              viewModel.scaffoldKey.currentState!.openDrawer();
            },
            child:
                SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Google Ads',
                            style: UIHelper.getAnaBaslikTextStyle()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          "Create effective and persuasive ads that generate leads and sales.",
                          style: UIHelper.getIcerikTextStyle(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'What is your post about *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: viewModel.formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                onTapOutside: ((event) {
                                  FocusScope.of(context).unfocus();
                                }),
                                textAlignVertical: TextAlignVertical.top,
                                maxLength: 800,
                                controller: viewModel.postAboutController,
                                autofocus: false,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.009,
                                  ),
                                  isDense: true,
                                  hintText:
                                      'Superbounce Running Shoes, minimalist running shoes, responsive bounce',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text('Keywords *',
                                  style: UIHelper.getBaslikTextStyle()),
                              const SizedBox(height: 5),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.047,
                                child: TextField(
                                  textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.all(10),
                                    isDense: true,
                                    border: const OutlineInputBorder(),
                                    hintText: 'best shoes for road running',
                                    suffixIcon: IconButton(
                                      icon:
                                          const Icon(Icons.add_circle_outline),
                                      onPressed: () {
                                        final instaViewModel =
                                            Provider.of<GoogleAdsViewModel>(
                                                context,
                                                listen: false);
                                        if (viewModel.keywordsController.text
                                            .isNotEmpty) {
                                          instaViewModel.addItemToList(
                                              viewModel.keywordsController.text,
                                              context);
                                          viewModel.keywordsController.text =
                                              "";
                                        } else {
                                          Provider.of<GoogleAdsViewModel>(
                                                  context,
                                                  listen: false)
                                              .checkAvailable(false);
                                          viewModel.keywordsController.text =
                                              "";
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
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
                                children:
                                    Provider.of<GoogleAdsViewModel>(context)
                                        .googleAdsKeywordsList
                                        .map((interest) {
                                  return Chip(
                                    label: Text(interest),
                                    onDeleted: () {
                                      Provider.of<GoogleAdsViewModel>(context,
                                              listen: false)
                                          .removeInterest(interest);
                                    },
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text('Tone *',
                                  style: UIHelper.getBaslikTextStyle()),
                              const SizedBox(height: 5),
                              Consumer<GoogleAdsViewModel>(
                                  builder: (context, viewModel, child) {
                                return Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.04,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: DropdownButton(
                                      focusColor: Colors.grey,
                                      elevation: 0,
                                      underline: Container(),
                                      isExpanded: true,
                                      value: viewModel.selectedTone,
                                      onChanged: (value) {
                                        Provider.of<GoogleAdsViewModel>(context,
                                                listen: false)
                                            .googleAdsTone(value.toString());
                                      },
                                      items: viewModel.googleAdsToneMap.keys
                                          .map((itemone) {
                                        return DropdownMenuItem(
                                            value: itemone,
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 20.0),
                                              child: Text(itemone),
                                            ));
                                      }).toList(),
                                    ));
                              }),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Provider.of<GoogleAdsViewModel>(context,
                                                listen: false)
                                            .animateContainer(context);
                                      },
                                      child: const Text('More options',
                                          style: TextStyle())),
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<GoogleAdsViewModel>(context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    icon:
                                        Provider.of<GoogleAdsViewModel>(context)
                                                .selectedDrafts
                                            ? const Icon(Icons.keyboard_arrow_down)
                                            : const Icon(Icons.keyboard_arrow_up),
                                  ),
                                ],
                              ),
                              AnimatedContainer(
                                color: Colors.white,
                                width: double.infinity,
                                height: Provider.of<GoogleAdsViewModel>(context,
                                            listen: false)
                                        .selectedDrafts
                                    ? MediaQuery.of(context).size.height * 0.19
                                    : 0,
                                duration: const Duration(milliseconds: 300),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Target Audience',
                                          style: UIHelper.getBaslikTextStyle()),
                                      const SizedBox(height: 5),
                                      TextField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        controller:
                                            viewModel.targetAudienceController,
                                        autofocus: false,
                                        minLines: 1,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                0.009,
                                          ),
                                          isDense: true,
                                          filled: true,
                                          fillColor: UIHelper.fillColor(),
                                          labelStyle: const TextStyle(fontSize: 13),
                                          hintText:
                                              'urban long distance runners',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Text('Brand',
                                          style: UIHelper.getBaslikTextStyle()),
                                      const SizedBox(height: 5),
                                      TextField(
                                        textAlignVertical:
                                            TextAlignVertical.bottom,
                                        controller: viewModel.brandsController,
                                        autofocus: false,
                                        decoration: InputDecoration(
                                          contentPadding: EdgeInsets.all(
                                            MediaQuery.of(context).size.height *
                                                0.009,
                                          ),
                                          isDense: true,
                                          labelStyle: const TextStyle(fontSize: 13),
                                          hintText: '',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          UIHelper.activeButtonColor(),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  onPressed:
                                      Provider.of<GoogleAdsViewModel>(
                                                      context)
                                                  .googleAdsKeywordsList
                                                  .isNotEmpty
                                          ? () {
                                              //Post İşlemleri
                                              Provider.of<GoogleAdsViewModel>(
                                                      context,
                                                      listen: false)
                                                  .postTransaction(
                                                      keywords: viewModel
                                                          .googleAdsKeywordsList
                                                          .toString(),
                                                      product: viewModel
                                                          .postAboutController
                                                          .text,
                                                      toneId: viewModel
                                                          .selectedToneId,
                                                      audience: viewModel
                                                          .targetAudienceController
                                                          .text,
                                                      brand: viewModel
                                                          .brandsController
                                                          .text);
                                            }
                                          : null,
                                  child: Selector<GoogleAdsViewModel, bool>(
                                    builder: (context, isLoading, child) {
                                      return isLoading
                                          ? const CircularProgressIndicator()
                                          : Text(
                                              'Generate',
                                              style:
                                                  UIHelper.getButtonTextStyle(),
                                            );
                                    },
                                    selector: (context, state) =>
                                        state.isLoading,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Consumer<GoogleAdsViewModel>(
                          builder: (context, state, child) {
                            return state.isDataAvailable
                                ? tabViews(context, state)
                                : const NoContent();
                          },
                        )
                      ])))),
    );
  }

  Column tabViews(BuildContext context, GoogleAdsViewModel viewmodel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.0,
          child: Row(
            children: [
              TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  color: const Color.fromARGB(255, 233, 236, 239),
                ),
                isScrollable: true,
                tabs: const [
                  Tab(
                      child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    'Preview',
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.2,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icons/refresh.svg'),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Reset All',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 203, 72, 72)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 233, 236, 239),
                            borderRadius: BorderRadius.circular(5)),
                        child: Center(
                            child: Text(viewmodel.totalList.length.toString())),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.75,
          child: TabBarView(
            children: [
              ListView.builder(
                  itemCount: viewmodel.totalList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: GoogleAdsAnswer(
                        contents: viewmodel.totalList[index].description!,
                        title: viewmodel.totalList[index].headline!,
                      ),
                    );
                  }),
              ListView.builder(
                itemCount: 5,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: GoogleAdsPreview(
                      contents: viewmodel.totalList[index].description!,
                      title: viewmodel.totalList[index].headline!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
