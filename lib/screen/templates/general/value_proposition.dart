import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/valueProposition_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class ValueProposition extends StatefulWidget {
  const ValueProposition({super.key});

  @override
  State<ValueProposition> createState() => _ValuePropositionState();
}

class _ValuePropositionState extends State<ValueProposition> {
  ValuePropositionViewModel viewModel = ValuePropositionViewModel();
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
                      Text('Value Proposition',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                          "Write a unique, creative, and strategic description that's designed to increase sales."),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'Product *',
                        style: UIHelper.getBaslikTextStyle(),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Form(
                        key: viewModel.formkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: UIHelper.textfieldYukseklik(),
                              child: TextFormField(
                                onChanged: (value) {},
                                controller: viewModel.product,
                                autofocus: false,
                                minLines: 1,
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(10),
                                  hintText: 'Talkios AI',
                                  filled: true,
                                  fillColor: UIHelper.fillColor(),
                                  labelStyle: TextStyle(fontSize: 13),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Product Description *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              maxLength: 1000,
                              onChanged: (value) {},
                              controller: viewModel.companyproductDescription,
                              autofocus: false,
                              minLines: 6,
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                labelStyle: TextStyle(fontSize: 13),
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
                            SizedBox(height: 5),
                            Container(
                              height: MediaQuery.of(context).size.height * 0.04,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(width: 1, color: Colors.grey),
                                borderRadius: BorderRadius.circular(10),
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
                                      .valuePropositionTone(value.toString());
                                },
                                items: viewModel.valuePropositionToneMap.keys
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
                                      Text('More options', style: TextStyle()),
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
                                      ? Icon(Icons.keyboard_arrow_down)
                                      : Icon(Icons.keyboard_arrow_up),
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
                              duration: Duration(milliseconds: 400),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Target Audience',
                                      style: UIHelper.getBaslikTextStyle(),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      onChanged: (value) {},
                                      controller: viewModel.targetAudience,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(10),
                                        isDense: true,
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: TextStyle(fontSize: 13),
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
                                onPressed: viewModel.product.text.isNotEmpty &&
                                        viewModel.companyproductDescription.text
                                            .isNotEmpty
                                    ? () {}
                                    : null,
                                child:
                                    Selector<ValuePropositionViewModel, bool>(
                                  builder: (context, isLoading, child) {
                                    return isLoading
                                        ? CircularProgressIndicator()
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
                          return state.isDataAvailable
                              ? Container()
                              : NoContent();
                        },
                      ),
                    ]))));
  }
}
