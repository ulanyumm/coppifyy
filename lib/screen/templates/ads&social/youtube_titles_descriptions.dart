import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/youtubeTitles_viewmodels.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class YoutubeTitlesDescriptions extends StatefulWidget {
  const YoutubeTitlesDescriptions({super.key});

  @override
  State<YoutubeTitlesDescriptions> createState() =>
      _YoutubeTitlesDescriptionsState();
}

class _YoutubeTitlesDescriptionsState extends State<YoutubeTitlesDescriptions> {
  YoutubeTitlesViewModel viewModel = YoutubeTitlesViewModel();

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
                      Text('Youtube Titles and Descriptions',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Optimize your videos for greater visibility and higher engagement.",
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Video topic*',
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
                              maxLength: 800,
                              controller: viewModel.videoTopicController,
                              autofocus: false,
                              minLines: 5,
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
                              height: MediaQuery.of(context).size.height * 0.01,
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
                                      final youtubeViewModel =
                                          Provider.of<YoutubeTitlesViewModel>(
                                              context,
                                              listen: false);
                                      if (viewModel.youtubeKeywordsController
                                          .text.isNotEmpty) {
                                        youtubeViewModel.addItemToList(
                                            viewModel
                                                .youtubeKeywordsController.text,
                                            context);
                                        viewModel.youtubeKeywordsController
                                            .text = "";
                                      } else {
                                        Provider.of<YoutubeTitlesViewModel>(
                                                context,
                                                listen: false)
                                            .checkAvailable(false);
                                        viewModel.youtubeKeywordsController
                                            .text = "";
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
                                controller: viewModel.youtubeKeywordsController,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children:
                                  Provider.of<YoutubeTitlesViewModel>(context)
                                      .youtubeKeywordsList
                                      .map((interest) {
                                return Chip(
                                  label: Text(interest),
                                  onDeleted: () {
                                    Provider.of<YoutubeTitlesViewModel>(context,
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
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: DropdownButton(
                                focusColor: Colors.grey,
                                elevation: 0,
                                underline: Container(),
                                isExpanded: true,
                                value: viewModel.selectedTone,
                                onChanged: (value) {
                                  Provider.of<YoutubeTitlesViewModel>(context,
                                          listen: false)
                                      .youtubeTone(value.toString());
                                },
                                items: viewModel.youtubeToneMap.keys
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
                                      Provider.of<YoutubeTitlesViewModel>(
                                              context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<YoutubeTitlesViewModel>(context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<YoutubeTitlesViewModel>(
                                              context)
                                          .selectedDrafts
                                      ? Icon(Icons.keyboard_arrow_down)
                                      : Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                            AnimatedContainer(
                              color: Colors.white,
                              width: double.infinity,
                              height: Provider.of<YoutubeTitlesViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.15
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
                                      controller: viewModel.youtubeAudience,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: TextStyle(fontSize: 13),
                                        hintText: 'spring wedding guests',
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
                                              0.01,
                                    ),
                                    Text('Brand',
                                        style: UIHelper.getBaslikTextStyle()),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller: viewModel.youtubeBrand,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(10),
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: TextStyle(fontSize: 13),
                                        hintText: 'The Rock Company',
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
                                onPressed: viewModel.videoTopicController.text
                                            .isNotEmpty &&
                                        Provider.of<YoutubeTitlesViewModel>(
                                                context)
                                            .youtubeKeywordsList
                                            .isNotEmpty
                                    ? () {}
                                    : null,
                                child: Selector<YoutubeTitlesViewModel, bool>(
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
                      Consumer<YoutubeTitlesViewModel>(
                        builder: (context, state, child) {
                          return state.isDataAvailable
                              ? Container()
                              : NoContent();
                        },
                      ),
                    ]))));
  }
}
