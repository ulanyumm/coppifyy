import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/linkedinPost_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class LinkedinPostScreen extends StatefulWidget {
  const LinkedinPostScreen({super.key});

  @override
  State<LinkedinPostScreen> createState() => _LinkedinPostScreenState();
}

class _LinkedinPostScreenState extends State<LinkedinPostScreen> {
  LinkedinPostsViewModel viewModel = LinkedinPostsViewModel();
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
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  Text('Linkedin Post',
                      style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                      "Engage your target audience with thought-provoking and persuasive content."),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'What is your post about *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          maxLength: 800,
                          controller: viewModel.postAboutController,
                          autofocus: false,
                          minLines: 5,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            hintText:
                                'Launching a new start-up that builds rockets',
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
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text('Additional context *',
                            style: UIHelper.getBaslikTextStyle()),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              border: OutlineInputBorder(),
                              hintText: 'space travel, mars',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  final linkedinModel =
                                      Provider.of<LinkedinPostsViewModel>(
                                          context,
                                          listen: false);
                                  if (viewModel
                                      .postAboutController.text.isNotEmpty) {
                                    linkedinModel.addItemToList(
                                        viewModel
                                            .additionalContextController.text,
                                        context);
                                    viewModel.additionalContextController.text =
                                        "";
                                  } else {
                                    Provider.of<LinkedinPostsViewModel>(context,
                                            listen: false)
                                        .checkAvailable(false);
                                    viewModel.additionalContextController.text =
                                        "";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Değer giriniz"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            controller: viewModel.additionalContextController,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children: viewModel.linkedinPostsKeywordsList
                              .map((interest) {
                            return Chip(
                              label: Text(interest),
                              onDeleted: () {
                                Provider.of<LinkedinPostsViewModel>(context,
                                        listen: false)
                                    .removeInterest(interest);
                              },
                            );
                          }).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                        SizedBox(height: 5),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.04,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: DropdownButton(
                            focusColor: Colors.grey,
                            elevation: 0,
                            underline: Container(),
                            isExpanded: true,
                            value: viewModel.selectedTone,
                            onChanged: (value) {
                              Provider.of<LinkedinPostsViewModel>(context,
                                      listen: false)
                                  .linkedinAdsTone(value.toString());
                            },
                            items: viewModel.linkedinAdsToneMap.keys
                                .map((itemone) {
                              return DropdownMenuItem(
                                  value: itemone,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Text(itemone),
                                  ));
                            }).toList(),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.04,
                        ),
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Provider.of<LinkedinPostsViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                child:
                                    Text('More options', style: TextStyle())),
                            IconButton(
                              onPressed: () {
                                Provider.of<LinkedinPostsViewModel>(context,
                                        listen: false)
                                    .animateContainer(context);
                              },
                              icon: Provider.of<LinkedinPostsViewModel>(context,
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
                          height: Provider.of<LinkedinPostsViewModel>(context,
                                      listen: false)
                                  .selectedDrafts
                              ? MediaQuery.of(context).size.height * 0.12
                              : 0,
                          duration: Duration(milliseconds: 300),
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
                                  controller:
                                      viewModel.targetAudienceController,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(10),
                                    isDense: true,
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: TextStyle(fontSize: 13),
                                    hintText:
                                        'space travelers unafraid of the great unkown',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('Company name',
                                    style: UIHelper.getBaslikTextStyle()),
                                SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: viewModel.brandController,
                                  autofocus: false,
                                  minLines: 1,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(10),
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: TextStyle(fontSize: 13),
                                    hintText: 'The Rock Company',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
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
                            onPressed: viewModel
                                        .postAboutController.text.isNotEmpty &&
                                    Provider.of<LinkedinPostsViewModel>(context)
                                        .linkedinPostsKeywordsList
                                        .isNotEmpty
                                ? () {
                                    //post işlemleri
                                  }
                                : null,
                            child: Selector<LinkedinPostsViewModel, bool>(
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
                  Consumer<LinkedinPostsViewModel>(
                    builder: (context, state, child) {
                      return state.isDataAvailable ? Container() : NoContent();
                    },
                  ),
                ]))));
  }
}
