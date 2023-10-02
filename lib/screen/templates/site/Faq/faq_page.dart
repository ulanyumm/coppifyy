import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/Faq/faq_modelview.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class FaqsScreen extends StatefulWidget {
  const FaqsScreen({super.key});

  @override
  State<FaqsScreen> createState() => _FaqsScreenState();
}

class _FaqsScreenState extends State<FaqsScreen> {
  FaqsScreenModelView vModel = FaqsScreenModelView();
  @override
  dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<FaqsScreenModelView>(context);
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
                      Text("FAQ's", style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Generate frequently asked questions based on your product description.",
                        style: UIHelper.getIcerikTextStyle(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Product name *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.faqsFormkey,
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
                              controller: viewModel.faqsProductController,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText: 'Netflix, Spotify, Uber',
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
                              'Product description *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            TextFormField(
                              onChanged: (value) {
                                viewModel.isButtonActiveFunc();
                              },
                              controller:
                                  viewModel.faqsProductDescriptionController,
                              autofocus: false,
                              minLines: 5,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText:
                                    'Explain here to the AI what your \nproduct (or service) is about. \nRewrite to get different results',
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
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<FaqsScreenModelView>(
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
                                      Provider.of<FaqsScreenModelView>(context,
                                              listen: false)
                                          .faqsTone(value.toString());
                                    },
                                    items: viewModel.faqsToneMap.keys
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
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                InkWell(
                                    onTap: () {
                                      Provider.of<FaqsScreenModelView>(context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: const Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<FaqsScreenModelView>(context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<FaqsScreenModelView>(
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
                              height: Provider.of<FaqsScreenModelView>(context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.08
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
                                    const SizedBox(height: 5),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.04,
                                      child: TextField(
                                        controller:
                                            viewModel.faqsAudienceController,
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
                                          hintText: 'Marketer, Developer',
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                        ),
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                      ),
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
                                    backgroundColor:
                                        UIHelper.activeButtonColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: viewModel.faqsProductController.text
                                            .isNotEmpty &&
                                        viewModel
                                            .faqsProductDescriptionController
                                            .text
                                            .isNotEmpty
                                    ? () {
                                        // Post İşlemleri
                                        Provider.of<FaqsScreenModelView>(
                                                context,
                                                listen: false)
                                            .postTransactions(
                                                productName: viewModel
                                                    .faqsProductController.text,
                                                productDescription: viewModel
                                                    .faqsProductDescriptionController
                                                    .text,
                                                toneId:
                                                    viewModel.selectedToneId,
                                                audience: viewModel
                                                    .faqsAudienceController
                                                    .text);
                                      }
                                    : null,
                                child: Selector<FaqsScreenModelView, bool>(
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
                      Consumer<FaqsScreenModelView>(
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
                                              named: "Faq",
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
