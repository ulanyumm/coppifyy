import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewritecontent_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/not_content.dart';

class RewriteContent extends StatefulWidget {
  const RewriteContent({super.key});

  @override
  State<RewriteContent> createState() => _RewriteContentState();
}

class _RewriteContentState extends State<RewriteContent> {
  RewriteContentViewModel vModel = RewriteContentViewModel();
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
    var viewModel = Provider.of<RewriteContentViewModel>(context);

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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Rewrite content', style: UIHelper.getAnaBaslikTextStyle()),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Refresh and repurpose content while making it more engaging and effective.',
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text('What do you want to do?',
                      style: UIHelper.getBaslikTextStyle()),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(children: [
                    Row(children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(width: 1, color: Colors.grey),
                            elevation: 0,
                            backgroundColor:
                                Provider.of<RewriteContentViewModel>(
                                          context,
                                        ).selectedButtonIndex ==
                                        0
                                    ? Colors.grey
                                    : Colors.transparent,
                          ),
                          onPressed: () {
                            Provider.of<RewriteContentViewModel>(context,
                                    listen: false)
                                .rewriteButton(0);
                          },
                          child: const Text(
                            'Improve',
                            style: TextStyle(
                                color: Colors.black54, fontSize: 12.5),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(width: 1, color: Colors.grey),
                              elevation: 0,
                              backgroundColor:
                                  Provider.of<RewriteContentViewModel>(context,
                                                  listen: false)
                                              .selectedButtonIndex ==
                                          1
                                      ? Colors.grey
                                      : Colors.transparent,
                            ),
                            onPressed: () {
                              Provider.of<RewriteContentViewModel>(context,
                                      listen: false)
                                  .rewriteButton(1);
                            },
                            child: const Text('Simplify',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.5))),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(width: 1, color: Colors.grey),
                              elevation: 0,
                              backgroundColor:
                                  Provider.of<RewriteContentViewModel>(context,
                                                  listen: false)
                                              .selectedButtonIndex ==
                                          2
                                      ? Colors.grey
                                      : Colors.transparent,
                            ),
                            onPressed: () {
                              Provider.of<RewriteContentViewModel>(context,
                                      listen: false)
                                  .rewriteButton(2);
                            },
                            child: const Text('Shorten',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.5))),
                      ),
                      Expanded(
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              side: const BorderSide(width: 1, color: Colors.grey),
                              elevation: 0,
                              backgroundColor:
                                  Provider.of<RewriteContentViewModel>(context,
                                                  listen: false)
                                              .selectedButtonIndex ==
                                          3
                                      ? Colors.grey
                                      : Colors.transparent,
                            ),
                            onPressed: () {
                              Provider.of<RewriteContentViewModel>(context,
                                      listen: false)
                                  .rewriteButton(3);
                            },
                            child: const Text('Expand',
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 12.5))),
                      )
                    ]),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(width: 1, color: Colors.grey),
                            elevation: 0,
                            backgroundColor:
                                Provider.of<RewriteContentViewModel>(context,
                                                listen: false)
                                            .selectedButtonIndex ==
                                        4
                                    ? Colors.grey
                                    : Colors.transparent,
                          ),
                          onPressed: () {
                            Provider.of<RewriteContentViewModel>(context,
                                    listen: false)
                                .rewriteButton(4);
                          },
                          child: const Text('Rephrase',
                              style: TextStyle(
                                  color: Colors.black54, fontSize: 12.5))),
                    )
                  ]),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Text(
                    'Text to be rewritten *',
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
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (String value) {
                            Provider.of<RewriteContentViewModel>(context,
                                    listen: false)
                                .isButtonActiveFunc(
                              viewModel.rewriteContent.text,
                            );
                          },
                          maxLength: 6000,
                          controller: viewModel.rewriteContent,
                          autofocus: false,
                          minLines: 4,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            isDense: true,
                            filled: true,
                            fillColor: UIHelper.fillColor(),
                            labelStyle: const TextStyle(fontSize: 13),
                            hintText:
                                'Write an introduction to an essay about philosophy',
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
                        Text('Tone', style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(
                          height: 5,
                        ),
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
                              Provider.of<RewriteContentViewModel>(context,
                                      listen: false)
                                  .rewriteTone(value.toString());
                            },
                            items: viewModel.rewriteToneMap.keys.map((itemone) {
                              return DropdownMenuItem(
                                  value: itemone,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(itemone),
                                  ));
                            }).toList(),
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
                                backgroundColor: UIHelper.activeButtonColor(),
                              ),
                              onPressed: viewModel.isButtonActive != true
                                  ? null
                                  : () {
                                      // Post işlemleri
                                      Provider.of<RewriteContentViewModel>(
                                              context,
                                              listen: false)
                                          .postTransactions(
                                              content:
                                                  viewModel.rewriteContent.text,
                                              function: viewModel.funcName,
                                              toneId: viewModel.selectedToneId);
                                    },
                              child: Selector<RewriteContentViewModel, bool>(
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
                            )),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Consumer<RewriteContentViewModel>(
                builder: (context, state, child) {
                  return viewModel.totalList.isNotEmpty
                      ? SizedBox(
                          height: 500,
                          child: ListView.builder(
                              itemCount: viewModel.totalList.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: MultiAnsverScreen(
                                      contents:
                                          viewModel.totalList[index].toString(),
                                      named: "Rewrite content",
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
            ]),
          ),
        ));
  }
}
