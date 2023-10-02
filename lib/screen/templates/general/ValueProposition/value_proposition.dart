import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/ValueProposition/valueProposition_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class ValueProposition extends StatefulWidget {
  const ValueProposition({super.key});

  @override
  State<ValueProposition> createState() => _ValuePropositionState();
}

class _ValuePropositionState extends State<ValueProposition> {
  ValuePropositionViewModel vModel = ValuePropositionViewModel();
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
    var viewModel = Provider.of<ValuePropositionViewModel>(context);
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
                      Text('Value Proposition',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      const Text(
                          "Write a unique, creative, and strategic description that's designed to increase sales."),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Product *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: viewModel.product,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText: 'Talkios AI',
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
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Product Description *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              onChanged: (value) {},
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              maxLength: 1000,
                              controller: viewModel.companyproductDescription,
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
                                hintText:
                                    'An AI tool you can learn any language by voice talking with AI',
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
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<ValuePropositionViewModel>(
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
                                      Provider.of<ValuePropositionViewModel>(
                                              context,
                                              listen: false)
                                          .valuePropositionTone(
                                              value.toString());
                                    },
                                    items: viewModel
                                        .valuePropositionToneMap.keys
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
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Provider.of<ValuePropositionViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  child:
                                      const Text('More options', style: TextStyle()),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<ValuePropositionViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<ValuePropositionViewModel>(
                                              context,
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
                              height: Provider.of<ValuePropositionViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.1
                                  : 0,
                              duration: const Duration(milliseconds: 400),
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
                                      onChanged: (value) {},
                                      controller: viewModel.targetAudience,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.009,
                                        ),
                                        isDense: true,
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: const TextStyle(fontSize: 13),
                                        hintText: 'blog writers and marketers',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
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
                              height:
                                  MediaQuery.of(context).size.height * 0.035,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: UIHelper.activeButtonColor(),
                                ),
                                onPressed:
                                    viewModel.product.text.isNotEmpty &&
                                            viewModel.companyproductDescription
                                                .text.isNotEmpty
                                        ? () {
                                            Provider.of<ValuePropositionViewModel>(
                                                    context,
                                                    listen: false)
                                                .postTransactions(
                                                    productDescription: viewModel
                                                        .companyproductDescription
                                                        .text,
                                                    toneId: viewModel
                                                        .selectedToneId,
                                                    productname:
                                                        viewModel.product.text);
                                          }
                                        : null,
                                child:
                                    Selector<ValuePropositionViewModel, bool>(
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
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Consumer<ValuePropositionViewModel>(
                        builder: (context, state, child) {
                          return viewModel.totalList.isNotEmpty
                              ? SizedBox(
                                  height: 500,
                                  child: ListView.builder(
                                      itemCount: viewModel.totalList.length,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 20.0),
                                            child: MultiAnsverScreen(
                                              contents: viewModel
                                                  .totalList[index]
                                                  .toString(),
                                              named: "Value Proposition",
                                              id: index,
                                              onDismiss: () {
                                                viewModel
                                                    .removeWidgetIndex(index);
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
