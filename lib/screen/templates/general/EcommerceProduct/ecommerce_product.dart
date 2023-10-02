import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';
import 'ecommerceProduct_viewmodel.dart';

class EcommerceProduct extends StatefulWidget {
  const EcommerceProduct({super.key});

  @override
  State<EcommerceProduct> createState() => _EcommerceProductState();
}

class _EcommerceProductState extends State<EcommerceProduct> {
  EcommerceProductViewModel vmodel = EcommerceProductViewModel();
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
    var viewModel = Provider.of<EcommerceProductViewModel>(context);
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
                      Text('Ecommerce Product Description',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        "Write a unique, creative, and strategic description that's designed to increase sales.",
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
                        key: viewModel.ecommerceFormKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              maxLength: 1000,
                              onChanged: (value) {},
                              controller: viewModel.ecommerceProduct,
                              autofocus: false,
                              minLines: 1,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                isDense: true,
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
                              'Product Description *',
                              style: UIHelper.getBaslikTextStyle(),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            TextFormField(
                              controller: viewModel.productDescription,
                              onChanged: (value) {
                                Provider.of<EcommerceProductViewModel>(context,
                                        listen: false)
                                    .checkActiveButton();
                              },
                              autofocus: false,
                              minLines: 6,
                              decoration: InputDecoration(
                                isDense: true,
                                filled: true,
                                fillColor: UIHelper.fillColor(),
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                labelStyle: const TextStyle(fontSize: 13),
                                hintText:
                                    'Explain here to the AI what your product (or service) is about. Rewrite to get different results.',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.04,
                            ),
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<EcommerceProductViewModel>(
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
                                      Provider.of<EcommerceProductViewModel>(
                                              context,
                                              listen: false)
                                          .ecommerceTone(value.toString());
                                    },
                                    items: viewModel.ecommerceToneMap.keys
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
                                      Provider.of<EcommerceProductViewModel>(
                                              context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: const Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<EcommerceProductViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<EcommerceProductViewModel>(
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
                              height: Provider.of<EcommerceProductViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.1
                                  : 0,
                              duration: const Duration(milliseconds: 300),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Target Audience',
                                        style: UIHelper.getBaslikTextStyle()),
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
                                    MediaQuery.of(context).size.height * 0.04,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        UIHelper.activeButtonColor(),
                                  ),
                                  onPressed: viewModel.isActiveButton
                                      ? () {
                                          //post işlemleri
                                          Provider.of<
                                                      EcommerceProductViewModel>(
                                                  context,
                                                  listen: false)
                                              .ecommercePost(
                                                  productname: viewModel
                                                      .ecommerceProduct.text,
                                                  productDescription: viewModel
                                                      .productDescription.text,
                                                  toneId:
                                                      viewModel.selectedToneId);
                                        }
                                      : null,
                                  child:
                                      Selector<EcommerceProductViewModel, bool>(
                                    builder: (context, isLoading, child) {
                                      return isLoading
                                          ? const CircularProgressIndicator()
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
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Consumer<EcommerceProductViewModel>(
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
                                              named: "Ecommerce Product",
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
