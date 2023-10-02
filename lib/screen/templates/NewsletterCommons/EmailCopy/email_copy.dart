import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/EmailCopy/emailCopy_viewmodel.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/PressRelease/pressreleases_viewmodel.dart';
import 'package:hypotenuse/widgets/answers/totalAnswer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class EmailCopyScreen extends StatefulWidget {
  const EmailCopyScreen({super.key});

  @override
  State<EmailCopyScreen> createState() => _EmailCopyScreenState();
}

class _EmailCopyScreenState extends State<EmailCopyScreen> {
  EmailCopyViewModel vModel = EmailCopyViewModel();
  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<EmailCopyViewModel>(context);
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
                  Text('Email Copy', style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                      "Write copy to get your message across, no matter how crowded the inbox.",
                      style: UIHelper.getIcerikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Purpose of email *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.emailCopyPostFormkey,
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
                          controller: viewModel.emailPurposeController,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText:
                                'announce new product launch of a portal gun',
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
                        Text(
                          'Keywords *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.048,
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.009,
                              ),
                              border: const OutlineInputBorder(),
                              hintText:
                                  'travel between universes, transport things quickly',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  final emailCopyViewModel =
                                      Provider.of<EmailCopyViewModel>(context,
                                          listen: false);
                                  if (viewModel.emailCopyKeywordsController.text
                                      .isNotEmpty) {
                                    emailCopyViewModel.addItemToList(
                                        viewModel
                                            .emailCopyKeywordsController.text,
                                        context);
                                    viewModel.emailCopyKeywordsController.text =
                                        "";
                                  } else {
                                    Provider.of<PressReleasesViewModel>(context,
                                            listen: false)
                                        .checkAvailable(false);
                                    viewModel.emailCopyKeywordsController.text =
                                        "";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Değer giriniz"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            controller: viewModel.emailCopyKeywordsController,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children: Provider.of<EmailCopyViewModel>(context)
                              .emailCopyKeywordsList
                              .map((interest) {
                            return Chip(
                                label: Text(interest),
                                onDeleted: () {
                                  Provider.of<EmailCopyViewModel>(context,
                                          listen: false)
                                      .removeInterest(interest);
                                });
                          }).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'Tone *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(height: 5),
                        Consumer<EmailCopyViewModel>(
                            builder: (context, viewModel, child) {
                          return Container(
                              height: MediaQuery.of(context).size.height * 0.04,
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
                                  Provider.of<EmailCopyViewModel>(context,
                                          listen: false)
                                      .emailCopyTone(value.toString());
                                },
                                items: viewModel.emailCopyToneMap.keys
                                    .map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
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
                                  Provider.of<EmailCopyViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                child:
                                    const Text('More options', style: TextStyle())),
                            IconButton(
                              onPressed: () {
                                Provider.of<EmailCopyViewModel>(context,
                                        listen: false)
                                    .animateContainer(context);
                              },
                              icon: Provider.of<EmailCopyViewModel>(context,
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
                          height: Provider.of<EmailCopyViewModel>(context,
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
                                  controller:
                                      viewModel.emailTargetAudienceController,
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
                                    hintText: 'spring wedding guests',
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
                                Text(
                                  'Company Name',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller:
                                      viewModel.emailCompanyNameController,
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
                            onPressed: viewModel.emailPurposeController.text
                                        .isNotEmpty &&
                                    Provider.of<EmailCopyViewModel>(context)
                                        .emailCopyKeywordsList
                                        .isNotEmpty
                                ? () {
                                    // Post İşlemleri
                                    Provider.of<EmailCopyViewModel>(context,
                                            listen: false)
                                        .postTransactions(
                                      purpose:
                                          viewModel.emailPurposeController.text,
                                      keywords: viewModel.emailCopyKeywordsList
                                          .toString(),
                                      toneId: viewModel.selectedToneId,
                                      audience: viewModel
                                          .emailTargetAudienceController.text,
                                      brand: viewModel
                                          .emailCompanyNameController.text,
                                    );
                                  }
                                : null,
                            child: Selector<EmailCopyViewModel, bool>(
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
                  Consumer<EmailCopyViewModel>(
                    builder: (context, state, child) {
                      return state.totalList.isNotEmpty
                          ? SizedBox(
                              height: 500,
                              child: ListView.builder(
                                  itemCount: viewModel.totalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: TotalAnswer(
                                          contents: viewModel
                                              .totalList[index].mail!.email
                                              .toString(),
                                          title: viewModel
                                              .totalList[index].mail!.subject
                                              .toString(),
                                          id: index,
                                          onDismiss: () {
                                            viewModel.removeWidgetIndex(index);
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
