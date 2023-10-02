import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/MarketingAngels/marketingAngles_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class MarketingAngles extends StatefulWidget {
  const MarketingAngles({super.key});

  @override
  State<MarketingAngles> createState() => _MarketingAnglesState();
}

class _MarketingAnglesState extends State<MarketingAngles> {
  MarketingAnglesViewModel vModel = MarketingAnglesViewModel();
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
    var viewModel = Provider.of<MarketingAnglesViewModel>(context);
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
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Marketing angles',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                        'Generate marketing angles that are persuasive and compelling.',
                        style: UIHelper.getIcerikTextStyle()),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Details about your product or service *',
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
                            maxLength: 800,
                            onChanged: (String text) {
                              Provider.of<MarketingAnglesViewModel>(context,
                                      listen: false)
                                  .isButtonActiveFunc(
                                viewModel.productService.text,
                                viewModel.companyName.text,
                              );
                            },
                            controller: viewModel.productService,
                            autofocus: false,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(
                                MediaQuery.of(context).size.height * 0.009,
                              ),
                              isDense: true,
                              filled: true,
                              fillColor: UIHelper.fillColor(),
                              labelStyle: const TextStyle(fontSize: 13),
                              hintText: 'Floatly floral blue maxi dress',
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
                            'Company/Product name *',
                            style: UIHelper.getBaslikTextStyle(),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          TextFormField(
                            onTapOutside: ((event) {
                              FocusScope.of(context).unfocus();
                            }),
                            onChanged: (String value) {
                              Provider.of<MarketingAnglesViewModel>(context,
                                      listen: false)
                                  .isButtonActiveFunc(
                                viewModel.companyName.text,
                                viewModel.productService.text,
                              );
                            },
                            controller: viewModel.companyName,
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
                              hintText: 'Patty AI',
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
                          Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                          const SizedBox(height: 5),
                          Consumer<MarketingAnglesViewModel>(
                              builder: (context, viewModel, child) {
                            return Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.04,
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
                                    Provider.of<MarketingAnglesViewModel>(
                                            context,
                                            listen: false)
                                        .marketingAnglesTone(value.toString());
                                  },
                                  items: viewModel.marketingAnglesToneMap.keys
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
                            height: MediaQuery.of(context).size.height * 0.04,
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
                                onPressed: viewModel.isButtonActive != false
                                    ? () {
                                        Provider.of<MarketingAnglesViewModel>(
                                                context,
                                                listen: false)
                                            .postTransactions(
                                                product: viewModel
                                                    .productService.text,
                                                companyName:
                                                    viewModel.companyName.text,
                                                toneId:
                                                    viewModel.selectedToneId);
                                      }
                                    : null,
                                child: Selector<MarketingAnglesViewModel, bool>(
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
                              )),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    Consumer<MarketingAnglesViewModel>(
                      builder: (context, state, child) {
                        return viewModel.totalAds.isNotEmpty
                            ? SizedBox(
                                height: 500,
                                child: ListView.builder(
                                    itemCount: viewModel.totalAds.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 20.0),
                                          child: MultiAnsverScreen(
                                            contents: viewModel.totalAds[index]
                                                .toString(),
                                            named: "Marketing Angle",
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
                  ]),
            )));
  }
}
