import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/ecommerceProduct_viewmodel.dart';

class EcommerceProduct extends StatefulWidget {
  const EcommerceProduct({super.key});

  @override
  State<EcommerceProduct> createState() => _EcommerceProductState();
}

class _EcommerceProductState extends State<EcommerceProduct> {
  EcommerceProductViewModel viewModel = EcommerceProductViewModel();

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
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
              child: SingleChildScrollView(
                  physics: ClampingScrollPhysics(),
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
                        SizedBox(
                          height: 5,
                        ),
                        Form(
                          key: viewModel.ecommerceFormKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextFormField(
                                maxLength: 1000,
                                onChanged: (value) {},
                                controller: viewModel.ecommerceProduct,
                                autofocus: false,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Text(
                                'Product Description *',
                                style: UIHelper.getBaslikTextStyle(),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              TextFormField(
                                onChanged: (value) {
                                  setState(() {});
                                },
                                controller: viewModel.productDescription,
                                autofocus: false,
                                minLines: 6,
                                decoration: InputDecoration(
                                  isDense: true,
                                  filled: true,
                                  fillColor: UIHelper.fillColor(),
                                  contentPadding: EdgeInsets.all(10),
                                  labelStyle: TextStyle(fontSize: 13),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
                              ),
                              Text('Tone *',
                                  style: UIHelper.getBaslikTextStyle()),
                              SizedBox(height: 5),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                              Row(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Provider.of<EcommerceProductViewModel>(
                                                context,
                                                listen: false)
                                            .animateContainer(context);
                                      },
                                      child: Text('More options',
                                          style: TextStyle())),
                                  IconButton(
                                    onPressed: () {
                                      Provider.of<EcommerceProductViewModel>(
                                              context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    icon:
                                        Provider.of<EcommerceProductViewModel>(
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
                                height: Provider.of<EcommerceProductViewModel>(
                                            context,
                                            listen: false)
                                        .selectedDrafts
                                    ? MediaQuery.of(context).size.height * 0.12
                                    : 0,
                                duration: const Duration(milliseconds: 300),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Target Audience',
                                        style: UIHelper.getBaslikTextStyle()),
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
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
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
                                    onPressed: viewModel.ecommerceProduct.text
                                                .isNotEmpty &&
                                            viewModel.productDescription.text
                                                .isNotEmpty
                                        ? () {
                                            //post işlemleri
                                          }
                                        : null,
                                    child: Selector<EcommerceProductViewModel,
                                        bool>(
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
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Consumer<EcommerceProductViewModel>(
                            builder: (context, state, child) {
                          return state.isDataAvailable
                              ? Container()
                              : NoContent();
                        })
                      ])))),
    );
  }
}
