import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/askAnyThing_viewmodel.dart';
import 'package:hypotenuse/widgets/answers/askAnything.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class AskAIAnyThing extends StatefulWidget {
  const AskAIAnyThing({super.key});

  @override
  State<AskAIAnyThing> createState() => _AskAIAnyThingState();
}

class _AskAIAnyThingState extends State<AskAIAnyThing> {
  AskAnyThingViewModel viewModel = AskAnyThingViewModel();

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
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Ask AI anything',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Instruct our AI, from answering questions to writting custom content for any project.',
                      style: UIHelper.getIcerikTextStyle(),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Instruction or queston *',
                        style: UIHelper.getBaslikTextStyle()),
                    SizedBox(
                      height: 5,
                    ),
                    Form(
                      key: viewModel.formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextFormField(
                            maxLength: 6000,
                            onChanged: (value) {},
                            controller: viewModel.instructionQuestion,
                            autofocus: false,
                            minLines: 4,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(10),
                              isDense: true,
                              filled: true,
                              fillColor: UIHelper.fillColor(),
                              hintStyle: TextStyle(fontSize: 13),
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
                            height: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Text('Additional Context *',
                              style: UIHelper.getBaslikTextStyle()),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.04,
                            child: TextField(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                hintStyle: TextStyle(fontSize: 13),
                                hintText: 'Include mentions of stoicisim',
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.zero,
                                  icon: const Icon(Icons.add_circle_outline),
                                  onPressed: () {
                                    final askAnyThingModel =
                                        Provider.of<AskAnyThingViewModel>(
                                            context,
                                            listen: false);
                                    if (viewModel
                                        .additionalContext.text.isNotEmpty) {
                                      askAnyThingModel.addItemToList(
                                          viewModel.additionalContext.text,
                                          context);
                                      viewModel.additionalContext.text = "";
                                    } else {
                                      Provider.of<AskAnyThingViewModel>(context,
                                              listen: false)
                                          .checkAvailable(false);
                                      viewModel.additionalContext.text = "";
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('No additional context'),
                                      ));
                                    }
                                  },
                                ),
                              ),
                              controller: viewModel.additionalContext,
                            ),
                          ),
                          Wrap(
                            spacing: 8,
                            children: Provider.of<AskAnyThingViewModel>(context)
                                .additionalKeywordsList
                                .map((item) {
                              return Chip(
                                  label: Text(item),
                                  onDeleted: () {
                                    Provider.of<AskAnyThingViewModel>(context,
                                            listen: false)
                                        .removeInterest(item);
                                  });
                            }).toList(),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                          SizedBox(height: 5),
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
                                Provider.of<AskAnyThingViewModel>(context,
                                        listen: false)
                                    .askAnyTone(value.toString());
                              },
                              items: viewModel.askAnythingToneMap.keys
                                  .map((toneKeys) {
                                return DropdownMenuItem(
                                    value: toneKeys,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Text(
                                        toneKeys,
                                        style: TextStyle(fontSize: 13),
                                      ),
                                    ));
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.03,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: UIHelper.activeButtonColor(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: viewModel.instructionQuestion.text
                                          .isNotEmpty &&
                                      Provider.of<AskAnyThingViewModel>(context)
                                          .additionalKeywordsList
                                          .isNotEmpty
                                  ? () {
                                      Provider.of<AskAnyThingViewModel>(context,
                                              listen: false)
                                          .askAnyPost(
                                              input: viewModel
                                                  .instructionQuestion.text,
                                              context: viewModel
                                                  .additionalContext.text,
                                              toneId: viewModel.selectedToneId);
                                    }
                                  : null,
                              child: Selector<AskAnyThingViewModel, bool>(
                                builder: (context, isLoading, child) {
                                  return isLoading
                                      ? CircularProgressIndicator()
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
                    //Burası iyice anlaşılacak
                    Consumer<AskAnyThingViewModel>(
                        builder: (context, state, child) {
                      return state.isDataAvailable
                          ? AskAiAnythingAnswer(
                              contents:
                                  state.askAnyModel.data?.answer?.answer ?? '')
                          : NoContent();
                    })
                  ]),
            )));
  }
}
