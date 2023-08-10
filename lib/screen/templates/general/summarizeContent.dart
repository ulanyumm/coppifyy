import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/summarizeContent_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

import '../../../widgets/not_content.dart';

class SummarizeContent extends StatefulWidget {
  const SummarizeContent({super.key});

  @override
  State<SummarizeContent> createState() => _SummarizeContentState();
}

class _SummarizeContentState extends State<SummarizeContent> {
  SummarizeContentViewModel viewModel = SummarizeContentViewModel();

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
                      Text('Summarize content',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                          'Summarize content to make it more concise and say more with less..'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Text to summarize *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.key,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              maxLength: 60000,
                              onChanged: (value) {
                                setState(() {});
                              },
                              controller: viewModel.summarizeContent,
                              autofocus: false,
                              minLines: 10,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 13),
                                hintText:
                                    'Summarize content to make it more concise and say more with less.',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.03,
                            ),
                            Text('Type *',
                                style: UIHelper.getBaslikTextStyle()),
                            SizedBox(height: 5),
                            Container(
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
                                  Provider.of<SummarizeContentViewModel>(
                                          context,
                                          listen: false)
                                      .summarizeTone(value.toString());
                                },
                                items: viewModel.summarizeToneMap.keys
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
                            Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        UIHelper.activeButtonColor(),
                                  ),
                                  onPressed:
                                      viewModel.summarizeContent.text.isEmpty
                                          ? null
                                          : () {},
                                  child:
                                      Selector<SummarizeContentViewModel, bool>(
                                    builder: (context, isLoading, child) {
                                      return isLoading
                                          ? CircularProgressIndicator()
                                          : Text(
                                              'Generate',
                                              style:
                                                  UIHelper.getButtonTextStyle(),
                                            );
                                    },
                                    selector: (context, state) =>
                                        state.isLoading,
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Consumer<SummarizeContentViewModel>(
                        builder: (context, state, child) {
                          return state.isDataAvailable
                              ? Container()
                              : NoContent();
                        },
                      ),
                    ]))));
  }
}
