import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/SummarizeContent/summarizeContent_viewmodel.dart';
import 'package:hypotenuse/unkown/summarizeContent_answer.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';
import '../../../../widgets/not_content.dart';

class SummarizeContent extends StatefulWidget {
  const SummarizeContent({super.key});

  @override
  State<SummarizeContent> createState() => _SummarizeContentState();
}

class _SummarizeContentState extends State<SummarizeContent> {
  SummarizeContentViewModel vModel = SummarizeContentViewModel();
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
    var viewModel = Provider.of<SummarizeContentViewModel>(context);
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
                      Text('Summarize content',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                          'Summarize content to make it more concise and say more with less..'),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Text to summarize *',
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
                              onChanged: (value) {
                                Provider.of<SummarizeContentViewModel>(context,
                                        listen: false)
                                    .isButtonActiveFunc(
                                  viewModel.summarizeContent.text,
                                );
                              },
                              maxLength: 60000,
                              controller: viewModel.summarizeContent,
                              autofocus: false,
                              minLines: 10,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: const TextStyle(fontSize: 13),
                                hintText:
                                    'Summarize content to make it more \nconcise and say more with less.',
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
                            const SizedBox(height: 5),
                            Consumer<SummarizeContentViewModel>(
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
                                onPressed: viewModel
                                        .summarizeContent.text.isEmpty
                                    ? null
                                    : () {
                                        Provider.of<SummarizeContentViewModel>(
                                          context,
                                          listen: false,
                                        ).summarizePost(
                                          context:
                                              viewModel.summarizeContent.text,
                                          toneId: viewModel.selectedTone,
                                        );
                                      },
                                child:
                                    Selector<SummarizeContentViewModel, bool>(
                                  builder: (context, isLoading, child) {
                                    return isLoading
                                        ? const CircularProgressIndicator()
                                        : Text(
                                            'Generate',
                                            style:
                                                UIHelper.getButtonTextStyle(),
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
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Consumer<SummarizeContentViewModel>(
                        builder: (context, state, child) {
                          return viewModel.dataList.isNotEmpty
                              ? SizedBox(
                                  height: 400,
                                  child: ListView.builder(
                                      itemCount: viewModel.dataList.length,
                                      itemBuilder: (context, index) {
                                        return SummarizeAnswer(
                                          contents: viewModel.dataList[index]
                                              .summaries!.summary
                                              .toString(),
                                          named: "Summarize Content",
                                          id: viewModel
                                              .dataList[index].summaries!.id!,
                                          onDismiss: () {
                                            viewModel.removeWidget(
                                                viewModel.dataList[index]);
                                          },
                                        );
                                      }),
                                )
                              : const NoContent();
                        },
                      ),
                    ]))));
  }
}
