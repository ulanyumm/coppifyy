import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoHookProduction/videoHook_viewmodel.dart';
import 'package:hypotenuse/widgets/answers/totalAnswer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class VideoHookIntroduction extends StatefulWidget {
  const VideoHookIntroduction({super.key});

  @override
  State<VideoHookIntroduction> createState() => _VideoHookIntroductionState();
}

class _VideoHookIntroductionState extends State<VideoHookIntroduction> {
  VideoHookViewModel vModel = VideoHookViewModel();
  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<VideoHookViewModel>(context);

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
                      Text('Video hook and introduction',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Write a catchy and intriguing hook to reel viewers in and keep them watching.",
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Video topic *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.videoHookPostFormkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              controller: viewModel.videoTopicController,
                              autofocus: false,
                              minLines: 1,
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
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Keywords *',
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
                                      'Luxco specializes in airy, wedding-ready outfits at a',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      final videohookmodel =
                                          Provider.of<VideoHookViewModel>(
                                              context,
                                              listen: false);
                                      if (viewModel.videoHookKeywordsController
                                          .text.isNotEmpty) {
                                        videohookmodel.addItemToList(
                                            viewModel
                                                .videoHookKeywordsController
                                                .text,
                                            context);
                                        viewModel.videoHookKeywordsController
                                            .text = "";
                                      } else {
                                        Provider.of<VideoHookViewModel>(context,
                                                listen: false)
                                            .checkAvailable(false);
                                        viewModel.videoHookKeywordsController
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
                                    viewModel.videoHookKeywordsController,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children: Provider.of<VideoHookViewModel>(context,
                                      listen: false)
                                  .videoHookKeywordsList
                                  .map((interest) {
                                return Chip(
                                  label: Text(interest),
                                  onDeleted: () {
                                    Provider.of<VideoHookViewModel>(context,
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
                            const SizedBox(height: 5),
                            Consumer<VideoHookViewModel>(
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
                                      Provider.of<VideoHookViewModel>(context,
                                              listen: false)
                                          .videoHookTone(value.toString());
                                    },
                                    items: viewModel.videoHookToneMap.keys
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
                                      Provider.of<VideoHookViewModel>(context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: const Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<VideoHookViewModel>(context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<VideoHookViewModel>(context,
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
                              height: Provider.of<VideoHookViewModel>(context,
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
                                      controller: viewModel.videoHookAudience,
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
                                    Text(
                                      'Details about your product or service',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller:
                                          viewModel.videoHookDetailBrand,
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
                                onPressed: viewModel.videoTopicController.text
                                            .isNotEmpty &&
                                        Provider.of<VideoHookViewModel>(context)
                                            .videoHookKeywordsList
                                            .isNotEmpty
                                    ? () {
                                        //postişlemleri
                                        Provider.of<VideoHookViewModel>(context,
                                                listen: false)
                                            .postTransactions(
                                                videoTopic: viewModel
                                                    .videoTopicController.text,
                                                keywords: viewModel
                                                    .videoHookKeywordsList
                                                    .toString(),
                                                toneId:
                                                    viewModel.selectedToneId);
                                      }
                                    : null,
                                child: Selector<VideoHookViewModel, bool>(
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
                      Consumer<VideoHookViewModel>(
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
                                            child: TotalAnswer(
                                              contents: viewModel
                                                  .totalList[index].hook
                                                  .toString(),
                                              id: index,
                                              onDismiss: () {
                                                viewModel
                                                    .removeWidgetIndex(index);
                                              },
                                              title: viewModel
                                                  .totalList[index].hook
                                                  .toString(),
                                            ));
                                      }),
                                )
                              : const NoContent();
                        },
                      ),
                    ]))));
  }
}
