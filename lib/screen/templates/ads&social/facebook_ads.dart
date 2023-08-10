import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/facebookAds_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class FacebookAdsScreen extends StatefulWidget {
  const FacebookAdsScreen({super.key});

  @override
  State<FacebookAdsScreen> createState() => _FacebookAdsScreenState();
}

class _FacebookAdsScreenState extends State<FacebookAdsScreen> {
  FacebookAdsViewModel viewModel = FacebookAdsViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: viewModel.scaffoldKey,
          drawer: DrawerMenu(),
          floatingActionButton: FloatingActionButton(
            child:
                SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
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
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Text('Facebook Ads',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Craft powerful and compelling ads that speak to your target market.",
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Product *',
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
                            controller: viewModel.productController,
                            autofocus: false,
                            minLines: 2,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'floaty floral blue maxi dress',
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
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(),
                                hintText:
                                    'Luxco specializes in airy, wedding-ready outfits at a',
                                suffixIcon: IconButton(
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    final instaViewModel =
                                        Provider.of<FacebookAdsViewModel>(
                                            context,
                                            listen: false);
                                    if (viewModel
                                        .keywordsController.text.isNotEmpty) {
                                      instaViewModel.addItemToList(
                                          viewModel.keywordsController.text,
                                          context);
                                      viewModel.keywordsController.text = "";
                                    } else {
                                      Provider.of<FacebookAdsViewModel>(context,
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
                            children: Provider.of<FacebookAdsViewModel>(context)
                                .facebookAdsKeywordsList
                                .map((interest) {
                              return Chip(
                                label: Text(interest),
                                onDeleted: () {
                                  Provider.of<FacebookAdsViewModel>(context,
                                          listen: false)
                                      .removeInterest(interest);
                                },
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                          SizedBox(height: 5),
                          Container(
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
                              value: viewModel.selectedTone,
                              onChanged: (value) {
                                Provider.of<FacebookAdsViewModel>(context)
                                    .facebookAdsTone(value.toString());
                              },
                              items: viewModel.facebookAdsToneMap.keys
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
                            height: MediaQuery.of(context).size.height * 0.04,
                          ),
                          Row(
                            children: [
                              InkWell(
                                  onTap: () {
                                    Provider.of<FacebookAdsViewModel>(context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  child:
                                      Text('More options', style: TextStyle())),
                              IconButton(
                                onPressed: () {
                                  Provider.of<FacebookAdsViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                icon: Provider.of<FacebookAdsViewModel>(context,
                                            listen: false)
                                        .selectedDrafts
                                    ? Icon(Icons.keyboard_arrow_down)
                                    : Icon(Icons.keyboard_arrow_up),
                              ),
                            ],
                          ),
                          AnimatedContainer(
                            color: Colors.white,
                            width: double.infinity,
                            height: Provider.of<FacebookAdsViewModel>(context,
                                        listen: false)
                                    .selectedDrafts
                                ? MediaQuery.of(context).size.height * 0.2
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
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
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
                                      hintText: 'spring wedding guests',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    keyboardType: TextInputType.multiline,
                                    maxLines: null,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.016,
                                  ),
                                  Text(
                                    'Brand',
                                    style: UIHelper.getBaslikTextStyle(),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  TextField(
                                    controller: viewModel.brandController,
                                    autofocus: false,
                                    minLines: 1,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      isDense: true,
                                      filled: true,
                                      fillColor: UIHelper.fillColor(),
                                      labelStyle: TextStyle(fontSize: 13),
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
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.03,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: UIHelper.activeButtonColor(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: viewModel
                                          .productController.text.isNotEmpty &&
                                      Provider.of<FacebookAdsViewModel>(context)
                                          .facebookAdsKeywordsList
                                          .isNotEmpty
                                  ? () {
                                      //post işlemleri
                                    }
                                  : null,
                              child: Selector<FacebookAdsViewModel, bool>(
                                builder: (context, isLoading, child) {
                                  return isLoading
                                      ? CircularProgressIndicator()
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
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Consumer<FacebookAdsViewModel>(
                      builder: (context, state, child) {
                        return state.isDataAvailable
                            ? Container()
                            : NoContent();
                      },
                    ),
                  ])))),
    );
  }
}
