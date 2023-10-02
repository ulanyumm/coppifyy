import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/site/WebSiteHeadlineSlogans/websiteheadlinesviewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class WebsiteHeadlinesSlogans extends StatefulWidget {
  const WebsiteHeadlinesSlogans({super.key});

  @override
  State<WebsiteHeadlinesSlogans> createState() =>
      _WebsiteHeadlinesSlogansState();
}

class _WebsiteHeadlinesSlogansState extends State<WebsiteHeadlinesSlogans> {
  WebsiteHeadlinesViewModel vModel = WebsiteHeadlinesViewModel();
  @override
  dispose() {
    vModel.DisposeAll();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<WebsiteHeadlinesViewModel>(context);
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
                      Text('Website headlines and slogans',
                          style: UIHelper.getAnaBaslikTextStyle()),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const Text(
                          "Develop headlines and taglines that pack a punch and convert visitors into customers."),
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
                        key: viewModel.websitePostFormkey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              onTapOutside: ((event) {
                                FocusScope.of(context).unfocus();
                              }),
                              controller: viewModel.websiteProductController,
                              autofocus: false,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(
                                  MediaQuery.of(context).size.height * 0.009,
                                ),
                                hintText: 'floaty floral blue maxi dress',
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
                            Text('Keywords *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.048,
                              child: TextField(
                                decoration: InputDecoration(
                                  isDense: true,
                                  contentPadding: EdgeInsets.all(
                                    MediaQuery.of(context).size.height * 0.009,
                                  ),
                                  border: const OutlineInputBorder(),
                                  hintText: 'space travel, mars',
                                  suffixIcon: IconButton(
                                    icon: const Icon(Icons.add_circle_outline),
                                    onPressed: () {
                                      final websitemodel = Provider.of<
                                              WebsiteHeadlinesViewModel>(
                                          context,
                                          listen: false);
                                      if (viewModel.websiteProductController
                                          .text.isNotEmpty) {
                                        websitemodel.addItemToList(
                                            viewModel
                                                .websiteKeywordsController.text,
                                            context);
                                        viewModel.websiteKeywordsController
                                            .text = "";
                                      } else {
                                        Provider.of<WebsiteHeadlinesViewModel>(
                                                context,
                                                listen: false)
                                            .checkAvailable(false);
                                        viewModel.websiteKeywordsController
                                            .text = "";
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text("Değer giriniz"),
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                ),
                                controller: viewModel.websiteKeywordsController,
                              ),
                            ),
                            Wrap(
                              spacing: 8,
                              children: Provider.of<WebsiteHeadlinesViewModel>(
                                      context)
                                  .websiteKeywordsList
                                  .map((interest) {
                                return Chip(
                                  label: Text(interest),
                                  onDeleted: () {
                                    Provider.of<WebsiteHeadlinesViewModel>(
                                            context,
                                            listen: false)
                                        .removeInterest(interest);
                                  },
                                );
                              }).toList(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Text('Tone *',
                                style: UIHelper.getBaslikTextStyle()),
                            const SizedBox(height: 5),
                            Consumer<WebsiteHeadlinesViewModel>(
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
                                      Provider.of<WebsiteHeadlinesViewModel>(
                                              context,
                                              listen: false)
                                          .websiteTone(value.toString());
                                    },
                                    items: viewModel.websiteToneMap.keys
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
                                      Provider.of<WebsiteHeadlinesViewModel>(
                                              context,
                                              listen: false)
                                          .animateContainer(context);
                                    },
                                    child: const Text('More options',
                                        style: TextStyle())),
                                IconButton(
                                  onPressed: () {
                                    Provider.of<WebsiteHeadlinesViewModel>(
                                            context,
                                            listen: false)
                                        .animateContainer(context);
                                  },
                                  icon: Provider.of<WebsiteHeadlinesViewModel>(
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
                              height: Provider.of<WebsiteHeadlinesViewModel>(
                                          context,
                                          listen: false)
                                      .selectedDrafts
                                  ? MediaQuery.of(context).size.height * 0.18
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
                                      controller:
                                          viewModel.websiteTargetAudience,
                                      autofocus: false,
                                      minLines: 1,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding: EdgeInsets.all(
                                          MediaQuery.of(context).size.height *
                                              0.009,
                                        ),
                                        filled: true,
                                        fillColor: UIHelper.fillColor(),
                                        labelStyle: const TextStyle(fontSize: 13),
                                        hintText: 'spring wedding guests',
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                      ),
                                      keyboardType: TextInputType.multiline,
                                      maxLines: null,
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.02,
                                    ),
                                    Text('Brand',
                                        style: UIHelper.getBaslikTextStyle()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    TextField(
                                      controller:
                                          viewModel.websiteBrandController,
                                      autofocus: false,
                                      minLines: 1,
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
                                    backgroundColor:
                                        UIHelper.activeButtonColor(),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8))),
                                onPressed: viewModel.websiteProductController
                                            .text.isNotEmpty &&
                                        Provider.of<WebsiteHeadlinesViewModel>(
                                                context)
                                            .websiteKeywordsList
                                            .isNotEmpty
                                    ? () {
                                        // Post İşlemleri
                                        Provider.of<WebsiteHeadlinesViewModel>(
                                                context,
                                                listen: false)
                                            .postTransactions(
                                                product: viewModel
                                                    .websiteProductController
                                                    .text,
                                                keywords: viewModel
                                                    .websiteKeywordsList
                                                    .toString(),
                                                toneId:
                                                    viewModel.selectedToneId);
                                      }
                                    : null,
                                child:
                                    Selector<WebsiteHeadlinesViewModel, bool>(
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
                      Consumer<WebsiteHeadlinesViewModel>(
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
                                              named:
                                                  "Website Headlines and slogans",
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
