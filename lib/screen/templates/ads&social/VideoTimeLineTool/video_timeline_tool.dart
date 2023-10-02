import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoTimeLineTool/videoTimeline_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class VideoTimelineTool extends StatefulWidget {
  const VideoTimelineTool({super.key});

  @override
  State<VideoTimelineTool> createState() => _VideoTimelineToolState();
}

class _VideoTimelineToolState extends State<VideoTimelineTool> {
  VideoTimelineViewModel vModel = VideoTimelineViewModel();
  @override
  dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<VideoTimelineViewModel>(context);

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
                  Text(
                    'Video Timeline Tool',
                    style: UIHelper.getAnaBaslikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "An AI tool that allows you to create a second-by-second timeline for your videos.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    'Video topic *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.videoTimelinePostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (value) {
                            viewModel.isButtonActiveFunc();
                          },
                          maxLength: 1000,
                          controller: viewModel.videoTopicController,
                          autofocus: false,
                          minLines: 5,
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Video Length (min) *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            viewModel.isButtonActiveFunc();
                          },
                          controller: viewModel.videoLengthController,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: '1',
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
                          'Platform Name *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            viewModel.isButtonActiveFunc();
                          },
                          controller: viewModel.platformNameController,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'Youtube, Tiktok, Instagram, etc',
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
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIHelper.activeButtonColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: viewModel.isButtonActive
                                ? () {
                                    // Post İşlemleri
                                    Provider.of<VideoTimelineViewModel>(context,
                                            listen: false)
                                        .postTransactions(
                                            about: viewModel
                                                .videoTopicController.text,
                                            length: viewModel
                                                .videoLengthController.text,
                                            platform: viewModel
                                                .platformNameController.text);
                                  }
                                : null,
                            child: Selector<VideoTimelineViewModel, bool>(
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
                  Consumer<VideoTimelineViewModel>(
                    builder: (context, state, child) {
                      return viewModel.dataList.isNotEmpty
                          ? SizedBox(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: viewModel.dataList.length,
                                  itemBuilder: (context, index) {
                                    return MultiAnsverScreen(
                                      contents: viewModel.dataList[index]
                                          .descriptions!.description
                                          .toString(),
                                      named: 'Video Timeline Tool',
                                      id: viewModel
                                          .dataList[index].descriptions!.id!,
                                      onDismiss: () {
                                        viewModel.removeWidget(
                                            viewModel.dataList[index]);
                                      },
                                    );
                                  }),
                            )
                          : const NoContent();
                    },
                  ),
                ]))));
  }
}
