import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/rewritecontent_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

import '../../../widgets/not_content.dart';

class RewriteContent extends StatefulWidget {
  const RewriteContent({super.key});

  @override
  State<RewriteContent> createState() => _RewriteContentState();
}

class _RewriteContentState extends State<RewriteContent> {
  RewriteContentViewModel viewModel = RewriteContentViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          key: viewModel.scaffoldKey,
          drawer: DrawerMenu(),
          floatingActionButton: FloatingActionButton(
            child:
                SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
            backgroundColor: Colors.transparent,
            elevation: 0,
            onPressed: () {
              viewModel.scaffoldKey.currentState!.openDrawer();
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Rewrite content',
                        style: UIHelper.getAnaBaslikTextStyle()),
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
                        SizedBox(
                          height: 5,
                        ),
                        Column(children: [
                          Row(children: [
                            Expanded(
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
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
                                child: Text(
                                  'Improve',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                    elevation: 0,
                                    backgroundColor:
                                        Provider.of<RewriteContentViewModel>(
                                                        context,
                                                        listen: false)
                                                    .selectedButtonIndex ==
                                                1
                                            ? Colors.grey
                                            : Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Provider.of<RewriteContentViewModel>(
                                            context,
                                            listen: false)
                                        .rewriteButton(1);
                                  },
                                  child: Text('Simplify',
                                      style: TextStyle(color: Colors.black54))),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                    elevation: 0,
                                    backgroundColor:
                                        Provider.of<RewriteContentViewModel>(
                                                        context,
                                                        listen: false)
                                                    .selectedButtonIndex ==
                                                2
                                            ? Colors.grey
                                            : Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Provider.of<RewriteContentViewModel>(
                                            context,
                                            listen: false)
                                        .rewriteButton(2);
                                  },
                                  child: Text('Shorten',
                                      style: TextStyle(color: Colors.black54))),
                            ),
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    side: BorderSide(
                                        width: 1, color: Colors.grey),
                                    elevation: 0,
                                    backgroundColor:
                                        Provider.of<RewriteContentViewModel>(
                                                        context,
                                                        listen: false)
                                                    .selectedButtonIndex ==
                                                3
                                            ? Colors.grey
                                            : Colors.transparent,
                                  ),
                                  onPressed: () {
                                    Provider.of<RewriteContentViewModel>(
                                            context,
                                            listen: false)
                                        .rewriteButton(3);
                                  },
                                  child: Text('Expand',
                                      style: TextStyle(color: Colors.black54))),
                            )
                          ]),
                          Container(
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  side:
                                      BorderSide(width: 1, color: Colors.grey),
                                  elevation: 0,
                                  backgroundColor:
                                      Provider.of<RewriteContentViewModel>(
                                                      context,
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
                                child: Text('Rephrase',
                                    style: TextStyle(color: Colors.black54))),
                          )
                        ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text(
                          'Text to be rewritten *',
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
                                maxLength: 6000,
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: viewModel.rewriteContent,
                                autofocus: false,
                                minLines: 4,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: UIHelper.fillColor(),
                                  labelStyle: TextStyle(fontSize: 13),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text('Tone',
                                  style: UIHelper.getBaslikTextStyle()),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                                    Provider.of<RewriteContentViewModel>(
                                            context,
                                            listen: false)
                                        .rewriteTone(value.toString());
                                  },
                                  items: viewModel.rewriteToneMap.keys
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
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
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
                                        viewModel.rewriteContent.text.isEmpty
                                            ? null
                                            : () {},
                                    child:
                                        Selector<RewriteContentViewModel, bool>(
                                      builder: (context, isLoading, child) {
                                        return isLoading
                                            ? CircularProgressIndicator()
                                            : Text(
                                                'Generate',
                                                style: UIHelper
                                                    .getButtonTextStyle(),
                                              );
                                      },
                                      selector: (context, state) =>
                                          state.isLoading,
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
                        return state.isDataAvailable
                            ? Container()
                            : NoContent();
                      },
                    ),
                  ]),
            ),
          )),
    );
  }
}
