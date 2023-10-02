import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/WelcommingConfirmationEmail/welcomingemail_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class WelcomingConfirmationEmail extends StatefulWidget {
  const WelcomingConfirmationEmail({super.key});

  @override
  State<WelcomingConfirmationEmail> createState() =>
      _WelcomingConfirmationEmailState();
}

class _WelcomingConfirmationEmailState
    extends State<WelcomingConfirmationEmail> {
  WelcomingConfirmationEmailViewModel vModel =
      WelcomingConfirmationEmailViewModel();
  @override
  void dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<WelcomingConfirmationEmailViewModel>(context);
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
                  Text("Welcoming/Confirmation Email",
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Create the initial email that you send out to new subscribers, customers, or users.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'Product *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  Form(
                    key: viewModel.welcomeEmailFormKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (value) {
                            Provider.of<WelcomingConfirmationEmailViewModel>(
                                    context,
                                    listen: false)
                                .isButtonActiveFunc(
                              viewModel.welcomingProductController.text,
                              viewModel.welcomingDescriptionController.text,
                            );
                          },
                          controller: viewModel.welcomingProductController,
                          autofocus: false,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
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
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'Product description *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          onChanged: (value) {
                            Provider.of<WelcomingConfirmationEmailViewModel>(
                                    context,
                                    listen: false)
                                .isButtonActiveFunc(
                              viewModel.welcomingProductController.text,
                              viewModel.welcomingDescriptionController.text,
                            );
                          },
                          controller: viewModel.welcomingDescriptionController,
                          autofocus: false,
                          minLines: 5,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'Salsa, bachata and cha-cha dances',
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
                          'Benefits',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: viewModel.beneftsController,
                          autofocus: false,
                          minLines: 5,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'Salsa, bachata and cha-cha dances',
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
                        Consumer<WelcomingConfirmationEmailViewModel>(
                            builder: (context, state, child) {
                          print("active : ${state.isButtonActive}");
                          return SizedBox(
                            width: double.infinity,
                            height: MediaQuery.of(context).size.height * 0.035,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: UIHelper.activeButtonColor(),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8))),
                              onPressed: state.isButtonActive
                                  ? () {
                                      // Post İşlemleri
                                      state.postTransactions(
                                          product: viewModel
                                              .welcomingProductController.text,
                                          description: viewModel
                                              .welcomingDescriptionController
                                              .text,
                                          benefits:
                                              viewModel.beneftsController.text);
                                    }
                                  : null,
                              child: Selector<
                                  WelcomingConfirmationEmailViewModel, bool>(
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
                        })
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Consumer<WelcomingConfirmationEmailViewModel>(
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
                                          named: "Welcoming/Confirmation Email",
                                          id: index,
                                          onDismiss: () {
                                            viewModel.removeWidgetIndex(index);
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
