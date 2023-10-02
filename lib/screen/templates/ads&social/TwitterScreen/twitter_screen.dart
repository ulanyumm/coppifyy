import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/TwitterScreen/twitter_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class TwitterScreen extends StatefulWidget {
  const TwitterScreen({super.key});

  @override
  State<TwitterScreen> createState() => _TwitterScreenState();
}

class _TwitterScreenState extends State<TwitterScreen> {
  TwitterPostviewModel vModel = TwitterPostviewModel();

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
    var viewModel = Provider.of<TwitterPostviewModel>(context);

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
                  Text('Twitter', style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Don't know what to tweet? Get ideas for tweets that will engage your followers.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'What do you want to do? *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.twitterPostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<TwitterPostviewModel>(context,
                                      listen: false)
                                  .twitterButton(0);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Provider.of<TwitterPostviewModel>(
                                                  context,
                                                  listen: false)
                                              .selectedButtonIndex ==
                                          0
                                      ? Colors.blue
                                      : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text('Tweet',
                                    style: TextStyle(
                                        color:
                                            Provider.of<TwitterPostviewModel>(
                                                            context,
                                                            listen: false)
                                                        .selectedButtonIndex ==
                                                    0
                                                ? Colors.blue
                                                : Colors.grey,
                                        fontSize: 13)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              Provider.of<TwitterPostviewModel>(context,
                                      listen: false)
                                  .twitterButton(1);
                            },
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.05,
                              width: MediaQuery.of(context).size.height * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                border: Border.all(
                                  color: Provider.of<TwitterPostviewModel>(
                                                  context,
                                                  listen: false)
                                              .selectedButtonIndex ==
                                          1
                                      ? Colors.blue
                                      : Colors.grey,
                                  width: 2,
                                ),
                              ),
                              child: Center(
                                child: Text('Flood',
                                    style: TextStyle(
                                        color:
                                            Provider.of<TwitterPostviewModel>(
                                                            context,
                                                            listen: false)
                                                        .selectedButtonIndex ==
                                                    1
                                                ? Colors.blue
                                                : Colors.grey,
                                        fontSize: 13)),
                              ),
                            ),
                          )
                        ]),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (value) {
                            viewModel.checkActiveButton();
                          },
                          controller: viewModel.twitterPost,
                          autofocus: false,
                          minLines: 5,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'Tesla Cars',
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
                          height: MediaQuery.of(context).size.height * 0.025,
                        ),
                        Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(height: 5),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            focusColor: Colors.grey,
                            elevation: 0,
                            underline: Container(),
                            isExpanded: true,
                            value: viewModel.selectedTone,
                            onChanged: (value) {
                              Provider.of<TwitterPostviewModel>(context,
                                      listen: false)
                                  .instaTone(value.toString());
                            },
                            items: viewModel.twitterToneMap.keys.map((itemone) {
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
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIHelper.activeButtonColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: viewModel.twitterPost.text.isNotEmpty
                                ? () {
                                    //postişlemleri

                                    Provider.of<TwitterPostviewModel>(context,
                                            listen: false)
                                        .postTransactions(context,
                                            about: viewModel.twitterPost.text,
                                            function: viewModel.funcName,
                                            toneId: viewModel.selectedToneId);
                                  }
                                : null,
                            child: Selector<TwitterPostviewModel, bool>(
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
                  Consumer<TwitterPostviewModel>(
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
                                          contents: viewModel.totalList[index]
                                              .toString(),
                                          named: "Twitter Posts",
                                          onDismiss: () {
                                            viewModel.removeWidgetIndex(index);
                                          },
                                          id: index,
                                        ));
                                  }),
                            )
                          : const NoContent();
                    },
                  ),
                ]))));
  }
}
