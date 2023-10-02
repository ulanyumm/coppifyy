import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/AskAIAnyThing/askAnyThing_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class AskAIAnyThing extends StatefulWidget {
  const AskAIAnyThing({super.key});

  @override
  State<AskAIAnyThing> createState() => _AskAIAnyThingState();
}

class _AskAIAnyThingState extends State<AskAIAnyThing> {
  AskAnyThingViewModel vmodel = AskAnyThingViewModel();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    vmodel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<AskAnyThingViewModel>(context);
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Ask AI anything', style: UIHelper.getAnaBaslikTextStyle()),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text(
                'Instruct our AI, from answering questions to writting custom content for any project.',
                style: UIHelper.getIcerikTextStyle(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.02),
              Text('Instruction or question *',
                  style: UIHelper.getBaslikTextStyle()),
              const SizedBox(height: 5),
              Form(
                key: viewModel.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextFormField(
                      onTapOutside: ((event) {
                        FocusScope.of(context).unfocus();
                      }),
                      maxLength: 6000,
                      onChanged: (value) {
                        Provider.of<AskAnyThingViewModel>(context,
                                listen: false)
                            .isButtonActiveFunc(
                          instructionQuestion: value,
                          additionalContext: viewModel.additionalKeywordsList,
                        );
                      },
                      controller: viewModel.instructionQuestion,
                      autofocus: false,
                      minLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.009,
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        hintStyle: const TextStyle(fontSize: 13),
                        hintText:
                            'Write an introduction to an essay about \nphilosophy',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Text('Additional Context *',
                        style: UIHelper.getBaslikTextStyle()),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.045,
                      child: TextField(
                        onChanged: (_) {
                          Provider.of<AskAnyThingViewModel>(context,
                                  listen: false)
                              .isButtonActiveFunc(
                            instructionQuestion:
                                viewModel.instructionQuestion.text,
                            additionalContext: _.isEmpty ? [] : _.split(','),
                          );
                        },
                        decoration: InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.all(
                            MediaQuery.of(context).size.height * 0.009,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          hintStyle: const TextStyle(fontSize: 13),
                          hintText: 'Include mentions of stoicism',
                          suffixIcon: IconButton(
                            padding: EdgeInsets.zero,
                            icon: const Icon(Icons.add_circle_outline),
                            onPressed: () {
                              final askAnyThingModel =
                                  Provider.of<AskAnyThingViewModel>(context,
                                      listen: false);
                              if (viewModel.additionalContext.text.isNotEmpty) {
                                askAnyThingModel.addItemToList(
                                    viewModel.additionalContext.text, context);
                                viewModel.additionalContext.text = '';
                              } else {
                                askAnyThingModel.checkAvailable(false);
                                viewModel.additionalContext.text = '';
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('No additional context'),
                                  ),
                                );
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
                                .removeInterest(item, context);
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                    const SizedBox(height: 5),
                    Consumer<AskAnyThingViewModel>(
                      builder: (context, viewModel, child) {
                        return Container(
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
                                .map((itemone) {
                              return DropdownMenuItem(
                                value: itemone,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Text(itemone),
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    Selector<AskAnyThingViewModel, bool>(
                      builder: (context, isActiveButton, child) {
                        return SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UIHelper.activeButtonColor(),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                            onPressed: isActiveButton
                                ? () {
                                    Provider.of<AskAnyThingViewModel>(context,
                                            listen: false)
                                        .askAnyPost(
                                      context: viewModel.additionalKeywordsList
                                          .toString(),
                                      input: viewModel.instructionQuestion.text,
                                      toneId: viewModel.selectedToneId,
                                      contextx: context,
                                    );
                                  }
                                : null,
                            child: Selector<AskAnyThingViewModel, bool>(
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
                        );
                      },
                      selector: (context, state) => state.isActiveButton,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Consumer<AskAnyThingViewModel>(
                      builder: (context, state, child) {
                        return viewModel.dataList.isNotEmpty
                            ? SizedBox(
                                height: 400,
                                child: ListView.builder(
                                    itemCount: viewModel.dataList.length,
                                    itemBuilder: (context, index) {
                                      return MultiAnsverScreen(
                                        contents: viewModel
                                            .dataList[index].answer!.answer
                                            .toString(),
                                        named: 'Ask AI Anything',
                                        id: viewModel
                                            .dataList[index].answer!.id!,
                                        onDismiss: () {
                                          viewModel.removeWidget(
                                            viewModel.dataList[index],
                                          );
                                        },
                                      );
                                    }),
                              )
                            : const NoContent();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
