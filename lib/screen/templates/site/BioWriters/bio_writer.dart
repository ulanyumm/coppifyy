import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/BioWriters/biowriters_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class BioWriters extends StatefulWidget {
  const BioWriters({super.key});

  @override
  State<BioWriters> createState() => _BioWritersState();
}

class _BioWritersState extends State<BioWriters> {
  BioWritersViewModel vModel = BioWritersViewModel();

  @override
  dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<BioWritersViewModel>(context);
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
                  Text('Bio Writers', style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Text(
                    "Elevate any page with a well-written bio that will make people want to know more",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    'About person or company *',
                    style: UIHelper.getBaslikTextStyle(),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.bioWriterPostFormkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          controller: viewModel.bioWriterAboutController,
                          autofocus: false,
                          minLines: 3,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText:
                                'digital marketing expert with ower 10 years of experience in content marketing. Worked at Google, Facebook, and Amazon',
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
                          'Company Name *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextFormField(
                          controller: viewModel.bioWriterCompanyNameController,
                          autofocus: false,
                          minLines: 1,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            hintText: 'Patty AI',
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
                          'Keywords *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.048,
                          child: TextField(
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.009,
                              ),
                              border: const OutlineInputBorder(),
                              hintText: 'like hiking in free time',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.add_circle_outline),
                                onPressed: () {
                                  final bioWritersViewModel =
                                      Provider.of<BioWritersViewModel>(context,
                                          listen: false);
                                  if (viewModel.bioWriterKeywordsController.text
                                      .isNotEmpty) {
                                    bioWritersViewModel.addItemToList(
                                        viewModel
                                            .bioWriterKeywordsController.text,
                                        context);
                                    viewModel.bioWriterKeywordsController.text =
                                        "";
                                  } else {
                                    Provider.of<BioWritersViewModel>(context,
                                            listen: false)
                                        .checkAvailable(false);
                                    viewModel.bioWriterKeywordsController.text =
                                        "";
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text("Değer giriniz"),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                            controller: viewModel.bioWriterKeywordsController,
                          ),
                        ),
                        Wrap(
                          spacing: 8,
                          children: Provider.of<BioWritersViewModel>(context)
                              .bioWriterKeywordsList
                              .map((interest) {
                            return Chip(
                                label: Text(interest),
                                onDeleted: () {
                                  Provider.of<BioWritersViewModel>(context,
                                          listen: false)
                                      .removeInterest(interest);
                                });
                          }).toList(),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        Text(
                          'Point of View *',
                          style: UIHelper.getBaslikTextStyle(),
                        ),
                        const SizedBox(height: 5),
                        Consumer<BioWritersViewModel>(
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
                                  Provider.of<BioWritersViewModel>(context,
                                          listen: false)
                                      .bioWriterTone(value.toString());
                                },
                                items: viewModel.bioWriterToneMap.keys
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
                        Row(
                          children: [
                            InkWell(
                                onTap: () {
                                  Provider.of<BioWritersViewModel>(context,
                                          listen: false)
                                      .animateContainer(context);
                                },
                                child:
                                    const Text('More options', style: TextStyle())),
                            IconButton(
                              onPressed: () {
                                Provider.of<BioWritersViewModel>(context,
                                        listen: false)
                                    .animateContainer(context);
                              },
                              icon: Provider.of<BioWritersViewModel>(context,
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
                          height: Provider.of<BioWritersViewModel>(context,
                                      listen: false)
                                  .selectedDrafts
                              ? MediaQuery.of(context).size.height * 0.18
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
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller: viewModel
                                      .bioWriterTargetAudienceController,
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
                                    hintText: 'spring wedding guests',
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
                                  'Brand',
                                  style: UIHelper.getBaslikTextStyle(),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextField(
                                  controller:
                                      viewModel.bioWriterBrandController,
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    isDense: true,
                                    contentPadding: EdgeInsets.all(
                                      MediaQuery.of(context).size.height *
                                          0.009,
                                    ),
                                    filled: true,
                                    fillColor: UIHelper.fillColor(),
                                    labelStyle: const TextStyle(fontSize: 13),
                                    hintText: '',
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
                            onPressed: viewModel.bioWriterAboutController.text
                                        .isNotEmpty &&
                                    viewModel.bioWriterCompanyNameController
                                        .text.isNotEmpty &&
                                    Provider.of<BioWritersViewModel>(context)
                                        .bioWriterKeywordsList
                                        .isNotEmpty
                                ? () {
                                    // Post İşlemleri
                                    Provider.of<BioWritersViewModel>(context,
                                            listen: false)
                                        .postTransactions(
                                      object: viewModel
                                          .bioWriterAboutController.text,
                                      companyName: viewModel
                                          .bioWriterCompanyNameController.text,
                                      keywords: viewModel.bioWriterKeywordsList
                                          .toString(),
                                      viewId: viewModel.selectedToneId,
                                      audience: viewModel
                                          .bioWriterTargetAudienceController
                                          .text,
                                      brand: viewModel
                                          .bioWriterBrandController.text,
                                    );
                                  }
                                : null,
                            child: Selector<BioWritersViewModel, bool>(
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
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Consumer<BioWritersViewModel>(
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
                                          named: "Bio Writers",
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
