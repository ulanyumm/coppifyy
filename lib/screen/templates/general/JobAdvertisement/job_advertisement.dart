import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/JobAdvertisement/jobAdvertisement_viewModel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class JobAdvertisement extends StatefulWidget {
  const JobAdvertisement({super.key});

  @override
  State<JobAdvertisement> createState() => _JobAdvertisementState();
}

class _JobAdvertisementState extends State<JobAdvertisement> {
  JobAdvertisementViewModel vModel = JobAdvertisementViewModel();
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
    var viewModel = Provider.of<JobAdvertisementViewModel>(context);
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
                      Text('Job Advertisement',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Write a professional job advertisement that will help you attract top talents.',
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Job *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: viewModel.jobController,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: const TextStyle(fontSize: 12),
                                hintText:
                                    'architect, human, resources manager, etc',
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
                            Text(
                              'Job Info  *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              maxLength: 1000,
                              controller: viewModel.jobInfojobInfoController,
                              autofocus: false,
                              minLines: 6,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                isDense: true,
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: const TextStyle(fontSize: 13),
                                hintText: 'Info about the role',
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
                            Text(
                              'What employee are you looking for? *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              maxLength: 1000,
                              controller: viewModel.employee,
                              autofocus: false,
                              minLines: 4,
                              onChanged: (_) {
                                Provider.of<JobAdvertisementViewModel>(context,
                                        listen: false)
                                    .checkActiveButton(
                                  job: viewModel.jobController.text,
                                  jobInfo:
                                      viewModel.jobInfojobInfoController.text,
                                  employee: viewModel.employee.text,
                                );
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: const TextStyle(fontSize: 13),
                                hintText:
                                    "-Bachelor's degree in Computer Science or ",
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
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<JobAdvertisementViewModel>(
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
                                      Provider.of<JobAdvertisementViewModel>(
                                              context,
                                              listen: false)
                                          .instaTone(value.toString());
                                    },
                                    items: viewModel.jobToneMap.keys
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
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<JobAdvertisementViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  child: const Text('More options',
                                      style: TextStyle(color: Colors.grey)),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<JobAdvertisementViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<JobAdvertisementViewModel>(
                                              context,
                                              listen: false)
                                          .selectedDrafts
                                      ? const Icon(Icons.keyboard_arrow_down)
                                      : const Icon(Icons.keyboard_arrow_up),
                                ),
                              ],
                            ),
                            Selector<JobAdvertisementViewModel, bool>(
                                builder: (context, selectedDrafts, child) {
                                  return AnimatedContainer(
                                    color: Colors.white,
                                    width: double.infinity,
                                    height:
                                        Provider.of<JobAdvertisementViewModel>(
                                                    context,
                                                    listen: false)
                                                .selectedDrafts
                                            ? MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08
                                            : 0,
                                    duration: const Duration(milliseconds: 300),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Company Name',
                                              style: UIHelper
                                                  .getBaslikTextStyle()),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          TextField(
                                            controller: viewModel.companyName,
                                            autofocus: false,
                                            minLines: 1,
                                            decoration: InputDecoration(
                                              contentPadding: EdgeInsets.all(
                                                MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.009,
                                              ),
                                              filled: true,
                                              isDense: true,
                                              fillColor: UIHelper.fillColor(),
                                              labelStyle:
                                                  const TextStyle(fontSize: 13),
                                              hintText:
                                                  'blog writers and marketers',
                                              border: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                            ),
                                            keyboardType:
                                                TextInputType.multiline,
                                            maxLines: null,
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                                selector: (context, state) =>
                                    state.selectedDrafts),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Selector<JobAdvertisementViewModel, bool>(
                              builder: (context, isActiveButton, child) {
                                return SizedBox(
                                    width: double.infinity,
                                    height: MediaQuery.of(context).size.height *
                                        0.035,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              UIHelper.activeButtonColor(),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(8))),
                                      onPressed: isActiveButton
                                          ? () {
                                              Provider.of<JobAdvertisementViewModel>(
                                                      context,
                                                      listen: false)
                                                  .jobAdvertsingPost(
                                                      companyName: viewModel
                                                          .companyName.text,
                                                      info: viewModel
                                                          .jobInfojobInfoController
                                                          .text,
                                                      looking: viewModel
                                                          .employee.text,
                                                      toneId: viewModel
                                                          .selectedToneId,
                                                      job: viewModel
                                                          .jobController.text);
                                            }
                                          : null,
                                      child: Selector<JobAdvertisementViewModel,
                                          bool>(
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
                                    ));
                              },
                              selector: (context, state) =>
                                  state.isActiveButton,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Consumer<JobAdvertisementViewModel>(
                        builder: (context, state, child) {
                          return viewModel.totalAds.isNotEmpty
                              ? SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                      itemCount: viewModel.totalAds.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: MultiAnsverScreen(
                                            contents: viewModel.totalAds[index]
                                                .toString(),
                                            named: "Job Advertisement",
                                            onDismiss: () {
                                              viewModel
                                                  .removeWidgetIndex(index);
                                            },
                                            id: index,
                                          ),
                                        );
                                      }),
                                )
                              : const NoContent();
                        },
                      ),
                    ]))));
  }
}
