import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/ads&social/DiscountSpecialOffer/discountSpecial_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class DiscountSpecialOffer extends StatefulWidget {
  const DiscountSpecialOffer({super.key});

  @override
  State<DiscountSpecialOffer> createState() => _DiscountSpecialOfferState();
}

class _DiscountSpecialOfferState extends State<DiscountSpecialOffer> {
  DiscountSpecialViewModel vModel = DiscountSpecialViewModel();
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
    var viewModel = Provider.of<DiscountSpecialViewModel>(context);
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
                  Text('Discount / Special Offer',
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Have something special to offer your customers? Use social media to spread the ...",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'What is your purpose? *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.discountPostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: viewModel.discountPurpose,
                          autofocus: false,
                          minLines: 1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'a discount social media post',
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Product *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: viewModel.discountProduct,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'a stiletto heel',
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
                        Text(
                          'Product Description *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          maxLength: 1000,
                          controller: viewModel.discountProductDescription,
                          autofocus: false,
                          minLines: 6,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'luxury stiletto heel made by hand',
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
                            height: MediaQuery.of(context).size.height * 0.02),
                        Text(
                          'Discount / Special Offer',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: viewModel.discountSpecialOffer,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: '50% off',
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
                        Text(
                          'How to claim? *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            viewModel.checkActiveButton();
                          },
                          maxLength: 1000,
                          controller: viewModel.discountClaim,
                          autofocus: false,
                          minLines: 6,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'by buying a tailor made maxi dress',
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          'Tone *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(height: 5),
                        Consumer<DiscountSpecialViewModel>(
                            builder: (context, viewModel, child) {
                          return Container(
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
                                  Provider.of<DiscountSpecialViewModel>(context,
                                          listen: false)
                                      .discountTone(value.toString());
                                },
                                items: viewModel.discountToneMap.keys
                                    .map((itemone) {
                                  return DropdownMenuItem(
                                      value: itemone,
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 20.0),
                                        child: Text(itemone),
                                      ));
                                }).toList(),
                              ));
                        }),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.02,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: UIHelper.activeButtonColor(),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8))),
                            onPressed: viewModel
                                        .discountPurpose.text.isNotEmpty &&
                                    viewModel.discountProduct.text.isNotEmpty &&
                                    viewModel.discountProductDescription.text
                                        .isNotEmpty &&
                                    viewModel.discountClaim.text.isNotEmpty
                                ? () {
                                    Provider.of<DiscountSpecialViewModel>(
                                            context,
                                            listen: false)
                                        .postTransactions(
                                      context,
                                      description: viewModel
                                          .discountProductDescription.text,
                                      product: viewModel.discountProduct.text,
                                      toneId: viewModel.selectedToneId,
                                      want: viewModel.discountClaim.text,
                                    );
                                  }
                                : null,
                            child: Selector<DiscountSpecialViewModel, bool>(
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
                    height: MediaQuery.of(context).size.height * 0.025,
                  ),
                  Consumer<DiscountSpecialViewModel>(
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
                                          named: "Discount / Special Offer",
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
