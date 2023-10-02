import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/LandingPageContent/landingPage_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class LandingPageContent extends StatefulWidget {
  const LandingPageContent({super.key});

  @override
  State<LandingPageContent> createState() => _LandingPageContentState();
}

class _LandingPageContentState extends State<LandingPageContent> {
  LandingPageContentViewModel vmodel = LandingPageContentViewModel();
  @override
  dispose() {
    vmodel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<LandingPageContentViewModel>(context);
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
                physics: const ClampingScrollPhysics(),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Landing page content',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Create benefit-focused landing pages that entice visitors to take the next step.",
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
                        key: viewModel.landingPageFormkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              maxLength: 6000,
                              controller:
                                  viewModel.landingPageProductController,
                              autofocus: false,
                              minLines: 5,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText:
                                    'An AI copywriter that sounds like you',
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
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              'Name of product or service *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller:
                                  viewModel.landingPageCompannyNameController,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText: 'Patty AI',
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
                            Text('Unique features *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.045,
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
                                      final landingViewModel = Provider.of<
                                              LandingPageContentViewModel>(
                                          context,
                                          listen: false);
                                      if (viewModel
                                          .landingPageKeywordsController
                                          .text
                                          .isNotEmpty) {
                                        landingViewModel.addItemToList(
                                            viewModel
                                                .landingPageKeywordsController
                                                .text,
                                            context);
                                        viewModel.landingPageKeywordsController
                                            .text = "";
                                      } else {
                                        Provider.of<LandingPageContentViewModel>(
                                                context,
                                                listen: false)
                                            .checkAvailable(false);
                                        viewModel.landingPageKeywordsController
                                            .text = "";
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
                                controller:
                                    viewModel.landingPageKeywordsController,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children:
                                  Provider.of<LandingPageContentViewModel>(
                                          context)
                                      .landingPageKeywordsList
                                      .map((interest) {
                                return Chip(
                                    label: Text(interest),
                                    onDeleted: () {
                                      Provider.of<LandingPageContentViewModel>(
                                              context)
                                          .removeInterest(interest);
                                    });
                              }).toList(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<LandingPageContentViewModel>(
                                builder: (context, viewModel, child) {
                              return Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.04,
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
                                      Provider.of<LandingPageContentViewModel>(
                                              context,
                                              listen: false)
                                          .landingPageTone(value.toString());
                                    },
                                    items: viewModel.landingPageToneMap.keys
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Provider.of<LandingPageContentViewModel>(
                                              context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: const Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<LandingPageContentViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon:
                                      Provider.of<LandingPageContentViewModel>(
                                                  context,
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
                              height: Provider.of<LandingPageContentViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.19
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
                                      controller: viewModel
                                          .landingPageTargetKeywordsController,
                                      autofocus: false,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.009,
                                        ),
                                        isDense: true,
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: const TextStyle(fontSize: 13),
                                        hintText: 'blog writers and marketers',
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
                                    Text(
                                      'Company name',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: viewModel
                                          .landingPageCompanyNameController,
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            SizedBox(
                              width: double.infinity,
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        UIHelper.activeButtonColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: () {
                                  //Post işlemleri
                                  Provider.of<LandingPageContentViewModel>(
                                          context,
                                          listen: false)
                                      .postTransactions(
                                          product: viewModel
                                              .landingPageProductController
                                              .text,
                                          features: viewModel
                                              .landingPageKeywordsList
                                              .toString(),
                                          toneId: viewModel.selectedToneId,
                                          description: viewModel
                                              .landingPageCompannyNameController
                                              .text);
                                },
                                child:
                                    Selector<LandingPageContentViewModel, bool>(
                                  builder: (context, isLoading, child) {
                                    return isLoading
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            'Generate',
                                            style:
                                                UIHelper.getButtonTextStyle(),
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
                      Consumer<LandingPageContentViewModel>(
                        builder: (context, state, child) {
                          return viewModel.totalList.isNotEmpty
                              ? SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                      itemCount: viewModel.totalList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: MultiAnsverScreen(
                                              contents: viewModel
                                                  .totalList[index]
                                                  .featureDescription
                                                  .toString(),
                                              named: "Landing Page Content",
                                              id: index,
                                              onDismiss: () {
                                                viewModel
                                                    .removeWidgetIndex(index);
                                              },
                                            ));
                                      }),
                                )
                              : const NoContent();
                        },
                      ),
                    ]))));
  }
}
