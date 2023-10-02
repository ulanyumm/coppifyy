import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/ContestGiveway/contestGiveway_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class ContestGiveway extends StatefulWidget {
  const ContestGiveway({super.key});

  @override
  State<ContestGiveway> createState() => _ContestGivewayState();
}

class _ContestGivewayState extends State<ContestGiveway> {
  ContestGiveViewModel vModel = ContestGiveViewModel();
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
    var viewModel = Provider.of<ContestGiveViewModel>(context);

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
                  Text('Contest & Giveaway',
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Create captivating content and run engaging contests and giveaways.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'What are you looking for? *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.contestFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: viewModel.contestLookinFor,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'a[social media] contest or giveaway',
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
                          'Prize *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: viewModel.contestPrize,
                          autofocus: false,
                          minLines: 1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'iphone 15 pro max, 8gb',
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
                          'How to claim? *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLength: 1000,
                          controller: viewModel.contestClaim,
                          autofocus: false,
                          minLines: 6,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText:
                                '- Follow our channel \n -Leave a comment on this post \n - Tag three of your friends',
                            filled: true,
                            fillColor: const Color.fromARGB(
                              255,
                              255,
                              255,
                              255,
                            ),
                            labelStyle: const TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(height: 5),
                        Consumer<ContestGiveViewModel>(
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
                                  Provider.of<ContestGiveViewModel>(context,
                                          listen: false)
                                      .instaTone(value.toString());
                                },
                                items: viewModel.contestToneMap.keys
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
                                  Provider.of<ContestGiveViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                child:
                                    const Text('More options', style: TextStyle())),
                            IconButton(
                              onPressed: () {},
                              icon: Provider.of<ContestGiveViewModel>(context,
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
                          height: Provider.of<ContestGiveViewModel>(context,
                                      listen: false)
                                  .selectedDrafts
                              ? MediaQuery.of(context).size.height * 0.1
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
                                  controller: viewModel.contestTargetAudience,
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
                                    hintText: 'blog writers and marketers',
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
                            onPressed: () {
                              Provider.of<ContestGiveViewModel>(context,
                                      listen: false)
                                  .postTransactions(
                                      aim: viewModel.contestLookinFor.text,
                                      way: viewModel.contestClaim.text,
                                      prize: viewModel.contestPrize.text,
                                      toneId: viewModel.selectedToneId);
                            },
                            child: Selector<ContestGiveViewModel, bool>(
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
                  Consumer<ContestGiveViewModel>(
                    builder: (context, state, child) {
                      return viewModel.totalList.isNotEmpty
                          ? Container(
                              child: ListView.builder(
                                  itemCount: viewModel.totalList.length,
                                  itemBuilder: (context, index) {
                                    return Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 20.0),
                                        child: MultiAnsverScreen(
                                          contents: viewModel.totalList[index]
                                              .toString(),
                                          named: "Contest & Giveaway",
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
