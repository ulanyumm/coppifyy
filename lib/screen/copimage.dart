import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/model/copiImage_model.dart';
import 'package:hypotenuse/viewmodel/copiMage_viewmodeli.dart';
import 'package:hypotenuse/widgets/answers/copiMageAnswer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class CopiMageScreen extends StatefulWidget {
  const CopiMageScreen({super.key});

  @override
  State<CopiMageScreen> createState() => _CopiMageScreenState();
}

class _CopiMageScreenState extends State<CopiMageScreen> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<CopiMageViewModel>(context);
    return Scaffold(
        key: viewModel.copiMageScaffoldKey,
        drawer: const DrawerMenu(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.transparent,
          elevation: 0,
          onPressed: () {
            viewModel.copiMageScaffoldKey.currentState!.openDrawer();
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
                      Text('CopiMage', style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Text(
                        "Generate professional quality images from text for your website or blog",
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Image Description',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      const SizedBox(height: 5),
                      Form(
                        key: viewModel.copiMageformkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Stack(
                              children: [
                                TextFormField(
                                  onTapOutside: ((event) {
                                    FocusScope.of(context).unfocus();
                                  }),
                                  onChanged: (value) {
                                    Provider.of<CopiMageViewModel>(context,
                                            listen: false)
                                        .isButtonActiveFunc();
                                  },
                                  maxLength: 1500,
                                  minLines: 4,
                                  controller:
                                      viewModel.imageDescriptionController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: const EdgeInsets.all(10),
                                    hintText:
                                        'Photography of an astronaut driving a sports \n car on the moon',
                                    hintStyle: const TextStyle(fontSize: 13),
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
                                Positioned(
                                  top: MediaQuery.of(context).size.height *
                                      0.156,
                                  child: Text(
                                      'Promt input must be always in English',
                                      style: UIHelper.getIcerikTextStyle()),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.06,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'GPU Strength',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.2,
                                                child: CupertinoPicker(
                                                  backgroundColor: Colors.white,

                                                  itemExtent:
                                                      32, // Height of each item in the picker
                                                  onSelectedItemChanged:
                                                      (int index) {
                                                    Provider.of<CopiMageViewModel>(
                                                            context,
                                                            listen: false)
                                                        .updateGpuStrength(
                                                            viewModel
                                                                    .gpuStrength[
                                                                index]);
                                                  },
                                                  children: viewModel
                                                      .gpuStrength
                                                      .map((String item) {
                                                    return Center(
                                                      child: Text(item),
                                                    );
                                                  }).toList(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            Provider.of<CopiMageViewModel>(
                                                    context)
                                                .selectStrength,
                                            style: const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Style',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 200,
                                                child: CupertinoPicker(
                                                  backgroundColor: Colors.white,

                                                  itemExtent:
                                                      40, // Height of each item in the picker
                                                  onSelectedItemChanged:
                                                      (value) {
                                                    Provider.of<CopiMageViewModel>(
                                                            context,
                                                            listen: false)
                                                        .updateSelectedStyle(
                                                            value.toString());
                                                  },
                                                  children: viewModel
                                                      .styleList.keys
                                                      .map((String item) {
                                                    return Center(
                                                      child: Text(item),
                                                    );
                                                  }).toList(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            Provider.of<CopiMageViewModel>(
                                                    context)
                                                .selectStyle,
                                            style: const TextStyle(fontSize: 12),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Medium',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.42,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 200,
                                                child: CupertinoPicker(
                                                  backgroundColor: Colors.white,

                                                  itemExtent:
                                                      32, // Height of each item in the picker
                                                  onSelectedItemChanged:
                                                      (int index) {
                                                    Provider.of<CopiMageViewModel>(
                                                            context,
                                                            listen: false)
                                                        .updateSelectedMedium(
                                                            viewModel
                                                                    .imageMediumList[
                                                                index]);
                                                  },
                                                  children: viewModel
                                                      .imageMediumList
                                                      .map((String item) {
                                                    return Center(
                                                      child: Text(item),
                                                    );
                                                  }).toList(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            Provider.of<CopiMageViewModel>(
                                                    context)
                                                .selectMedium,
                                            style: const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Mood',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.05,
                                      width: MediaQuery.of(context).size.width *
                                          0.4,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 1, color: Colors.grey),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          showCupertinoModalPopup<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return SizedBox(
                                                height: 200,
                                                child: CupertinoPicker(
                                                  backgroundColor: Colors.white,

                                                  itemExtent:
                                                      40, // Height of each item in the picker
                                                  onSelectedItemChanged:
                                                      (int index) {
                                                    Provider.of<CopiMageViewModel>(
                                                            context,
                                                            listen: false)
                                                        .updateSelectedMood(
                                                            viewModel
                                                                    .imageMoodList[
                                                                index]);
                                                  },
                                                  children: viewModel
                                                      .imageMoodList
                                                      .map((String item) {
                                                    return Center(
                                                      child: Text(item),
                                                    );
                                                  }).toList(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Center(
                                          child: Text(
                                            Provider.of<CopiMageViewModel>(
                                                    context)
                                                .selectMood,
                                            style: const TextStyle(fontSize: 13),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Selector<CopiMageViewModel, bool>(
                              builder: (context, isActiveButton, child) {
                                return SizedBox(
                                  width: double.infinity,
                                  height:
                                      MediaQuery.of(context).size.height * 0.05,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor:
                                          UIHelper.activeButtonColor(),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    onPressed: isActiveButton
                                        ? () {
                                            Provider.of<CopiMageViewModel>(
                                                    context,
                                                    listen: false)
                                                .postTransiction(
                                                    prompt: viewModel
                                                        .imageDescriptionController
                                                        .text,
                                                    style: viewModel
                                                        .selectedStyleKey,
                                                    medium:
                                                        viewModel.selectMedium,
                                                    mood: viewModel.selectMood,
                                                    steps: viewModel
                                                        .selectStrength,
                                                    aspectRatio: 'S1',
                                                    samples: '4');
                                          }
                                        : null,
                                    child: Selector<CopiMageViewModel, bool>(
                                      builder: (context, isLoading, child) {
                                        return isLoading
                                            ? const CircularProgressIndicator()
                                            : Text(
                                                'Generate',
                                                style: UIHelper
                                                    .getButtonTextStyle(),
                                              );
                                      },
                                      selector: (context, state) =>
                                          state.isLoading,
                                    ),
                                  ),
                                );
                              },
                              selector: (context, state) =>
                                  state.isActiveButton,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.025,
                      ),
                      Consumer<CopiMageViewModel>(
                        builder: (context, viewModel, child) {
                          if (viewModel.isDataAvailable) {
                            List<Images>? imageList =
                                viewModel.dataModel.data?.images;

                            if (imageList == null || imageList.isEmpty) {
                              return const NoContent();
                            }
                            return SizedBox(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, // 2 kolon
                                  crossAxisSpacing: 8,
                                  mainAxisSpacing: 8,
                                ),
                                itemCount: imageList.length,
                                itemBuilder: (context, index) {
                                  final imageUrl = imageList[index].url;

                                  return GestureDetector(
                                    onTap: () {
                                      if (imageUrl != null) {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                ImageViewerScreen(imageUrl),
                                          ),
                                        );
                                      }
                                    },
                                    child: Image.network(imageUrl ?? '',
                                        fit: BoxFit.cover),
                                  );
                                },
                              ),
                            );
                          } else {
                            return const NoContent();
                          }
                        },
                      )
                    ]))));
  }
}
