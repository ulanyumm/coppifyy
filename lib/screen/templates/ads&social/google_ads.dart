import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/googleAds_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class GoogleAdsScreen extends StatefulWidget {
  const GoogleAdsScreen({super.key});

  @override
  State<GoogleAdsScreen> createState() => _GoogleAdsScreenState();
}

class _GoogleAdsScreenState extends State<GoogleAdsScreen> {
  GoogleAdsViewModel viewModel = GoogleAdsViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: viewModel.scaffoldKey,
        drawer: DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            viewModel.scaffoldKey.currentState!.openDrawer();
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
        body: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: SingleChildScrollView(
                physics: ClampingScrollPhysics(),
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
                      SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              textAlignVertical: TextAlignVertical.top,
                              maxLength: 800,
                              onChanged: (value) {},
                              controller: viewModel.postAboutController,
                              autofocus: false,
                              minLines: 2,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(10),
                                isDense: true,
                                hintText:
                                    'Superbounce Running Shoes, minimalist running shoes, responsive bounce',
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 13),
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
                            Text('Keywords *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                              child: TextField(
                                textAlignVertical: TextAlignVertical.bottom,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'best shoes for road running',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      final instaViewModel =
                                          Provider.of<GoogleAdsViewModel>(
                                              context,
                                              listen: false);
                                      if (viewModel
                                          .keywordsController.text.isNotEmpty) {
                                        instaViewModel.addItemToList(
                                            viewModel.keywordsController.text,
                                            context);
                                        viewModel.keywordsController.text = "";
                                      } else {
                                        Provider.of<GoogleAdsViewModel>(context,
                                                listen: false)
                                            .checkAvailable(false);
                                        viewModel.keywordsController.text = "";
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
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
                              children: Provider.of<GoogleAdsViewModel>(context)
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            SizedBox(height: 5),
                            Container(
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
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
                                  Provider.of<GoogleAdsViewModel>(context,
                                          listen: false)
                                      .googleAdsTone(value.toString());
                                },
                                items: viewModel.googleAdsToneMap.keys
                                    .map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(itemone),
                                      ));
                                }).toList(),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Provider.of<GoogleAdsViewModel>(context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<GoogleAdsViewModel>(context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<GoogleAdsViewModel>(context)
                                          .selectedDrafts
                                      ? Icon(Icons.keyboard_arrow_down)
                                      : Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                            AnimatedContainer(
                              color: Colors.white,
                              width: double.infinity,
                              height: Provider.of<GoogleAdsViewModel>(context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.17
                                  : 0,
                              duration: const Duration(milliseconds: 300),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Target Audience',
                                        style: UIHelper.getBaslikTextStyle()),
                                    SizedBox(height: 5),
                                    TextField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      controller:
                                          viewModel.targetAudienceController,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: TextStyle(fontSize: 13),
                                        hintText: 'urban long distance runners',
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
                                    SizedBox(height: 5),
                                    TextField(
                                      textAlignVertical:
                                          TextAlignVertical.bottom,
                                      controller: viewModel.brandsController,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        labelStyle: TextStyle(fontSize: 13),
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
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height * 0.04,
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
                                onPressed: viewModel
                                            .brandsController.text.isNotEmpty &&
                                        Provider.of<GoogleAdsViewModel>(context)
                                            .googleAdsKeywordsList
                                            .isNotEmpty
                                    ? () {
                                        //Post İşlemleri
                                      }
                                    : null,
                                child: Selector<GoogleAdsViewModel, bool>(
                                  builder: (context, isLoading, child) {
                                    return isLoading
                                        ? CircularProgressIndicator()
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
                      Consumer<GoogleAdsViewModel>(
                        builder: (context, state, child) {
                          return state.isDataAvailable
                              ? Container()
                              : NoContent();
                        },
                      ),
                    ]))));
  }
}
