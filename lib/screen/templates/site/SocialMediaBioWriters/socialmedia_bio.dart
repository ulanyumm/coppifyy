import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/SocialMediaBioWriters/socialmediaBio_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class SocialMediaBio extends StatefulWidget {
  const SocialMediaBio({super.key});

  @override
  State<SocialMediaBio> createState() => _SocialMediaBioState();
}

class _SocialMediaBioState extends State<SocialMediaBio> {
  SocialMediaBioViewModel vModel = SocialMediaBioViewModel();
  @override
  dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<SocialMediaBioViewModel>(context);
    return SafeArea(
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
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Social Media Bio',
                            style: UIHelper.getAnaBaslikTextStyle()),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "Revitalize any webpage by integrating a meticulously crafted Social Bio.",
                          style: UIHelper.getIcerikTextStyle(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Text(
                          'Media *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: viewModel.socialMediaBioMediaFormkey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  onTapOutside: ((event) {
                                    FocusScope.of(context).unfocus();
                                  }),
                                  onChanged: (value) {
                                    viewModel.isButtonActiveFunc();
                                  },
                                  controller:
                                      viewModel.socialMediaBioMediaController,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.009,
                                    ),
                                    hintText:
                                        'Facebook, Twitter, Instagram etc.',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                'Name ',
                                style: UIHelper.getBaslikTextStyle(),
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.05,
                                child: TextFormField(
                                  onChanged: (value) {
                                    viewModel.isButtonActiveFunc();
                                  },
                                  controller:
                                      viewModel.socialMediaBioNameController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.009,
                                    ),
                                    hintText: 'Your Name or Username',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text('Key Points *',
                                  style: UIHelper.getBaslikTextStyle()),
                              const SizedBox(height: 5),
                              TextFormField(
                                maxLength: 1000,
                                onChanged: (value) {
                                  viewModel.isButtonActiveFunc();
                                },
                                controller:
                                    viewModel.socialMediaBioKeyPointsController,
                                autofocus: false,
                                minLines: 5,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.009,
                                  ),
                                  hintText:
                                      '-Back-end Development \n-Mechanical Engineering',
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
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text('Tone *',
                                  style: UIHelper.getBaslikTextStyle()),
                              const SizedBox(height: 5),
                              Consumer<SocialMediaBioViewModel>(
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
                                        Provider.of<SocialMediaBioViewModel>(
                                                context,
                                                listen: false)
                                            .instaTone(value.toString());
                                      },
                                      items: viewModel
                                          .socialMediaBioMediaToneMap.keys
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
                                    MediaQuery.of(context).size.height * 0.04,
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
                                  onPressed: viewModel
                                              .socialMediaBioMediaController
                                              .text
                                              .isNotEmpty &&
                                          viewModel
                                              .socialMediaBioKeyPointsController
                                              .text
                                              .isNotEmpty
                                      ? () {
                                          // Post İşlemleri
                                          Provider.of<SocialMediaBioViewModel>(
                                                  context,
                                                  listen: false)
                                              .postTransactions(
                                                  keyPoints: viewModel
                                                      .socialMediaBioKeyPointsController
                                                      .text,
                                                  toneId:
                                                      viewModel.selectedToneId,
                                                  media: viewModel
                                                      .socialMediaBioMediaController
                                                      .text,
                                                  name: viewModel
                                                      .socialMediaBioNameController
                                                      .text);
                                        }
                                      : null,
                                  child:
                                      Selector<SocialMediaBioViewModel, bool>(
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
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        Consumer<SocialMediaBioViewModel>(
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
                                                    .toString(),
                                                named: "Social Media Bio",
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
                      ])))),
    );
  }
}
