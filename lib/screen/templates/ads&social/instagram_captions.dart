import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';
import '../../../viewmodel/instagram_viewmodel.dart';
import '../../../widgets/answers/instagramPost/captions_edit.dart';
import '../../../widgets/answers/instagramPost/captions_preview.dart';

class InstagramCaptions extends StatefulWidget {
  const InstagramCaptions({super.key});

  @override
  State<InstagramCaptions> createState() => _InstagramCaptionsState();
}

class _InstagramCaptionsState extends State<InstagramCaptions> {
  InstagramViewModel viewModel = InstagramViewModel();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Instagram Captions',
                    style: UIHelper.getAnaBaslikTextStyle()),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                    "Write scrool-stopping that encourages people to stop, look, and like",
                    style: UIHelper.getIcerikTextStyle()),
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
                  key: viewModel.instagramPostFormkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        maxLength: 800,
                        onChanged: (value) {},
                        controller: viewModel.instagramProduct,
                        autofocus: false,
                        minLines: 1,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          isDense: true,
                          hintText: 'Floaty floral blue maxi dress',
                          filled: true,
                          fillColor: Color.fromARGB(
                            255,
                            255,
                            255,
                            255,
                          ),
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
                      Text('Keywords *', style: UIHelper.getBaslikTextStyle()),
                      SizedBox(height: 5),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: EdgeInsets.all(10),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText:
                                'luxco specializes in airy, wedding-ready otfits at a',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.add_circle_outline),
                              onPressed: () {
                                final instaViewModel =
                                    Provider.of<InstagramViewModel>(context,
                                        listen: false);
                                if (viewModel.instagramKeywordsController.text
                                    .isNotEmpty) {
                                  instaViewModel.addItemToList(
                                      viewModel
                                          .instagramKeywordsController.text,
                                      context);
                                  viewModel.instagramKeywordsController.text =
                                      "";
                                } else {
                                  Provider.of<InstagramViewModel>(context,
                                          listen: false)
                                      .checkAvailable(false);
                                  viewModel.instagramKeywordsController.text =
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
                          controller: viewModel.instagramKeywordsController,
                        ),
                      ),
                      Wrap(
                        spacing: 8,
                        children: Provider.of<InstagramViewModel>(context)
                            .instagramKeywordsList
                            .map((item) {
                          return Chip(
                            label: Text(item),
                            onDeleted: () {
                              Provider.of<InstagramViewModel>(context,
                                      listen: false)
                                  .removeInterest(item);
                            },
                          );
                        }).toList(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text('Tone *', style: UIHelper.getBaslikTextStyle()),
                      SizedBox(height: 5),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.035,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: DropdownButton(
                          focusColor: Colors.grey,
                          elevation: 0,
                          underline: Container(),
                          isExpanded: true,
                          value: viewModel.selectedTone,
                          onChanged: (value) {
                            Provider.of<InstagramViewModel>(context,
                                    listen: false)
                                .instaTone(value.toString());
                          },
                          items: viewModel.instagramToneMap.keys.map((toneKey) {
                            return DropdownMenuItem(
                                value: toneKey,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 20.0),
                                  child: Text(toneKey),
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
                              Provider.of<InstagramViewModel>(context,
                                      listen: false)
                                  .animateContainer(context);
                            },
                            child: Text('More options', style: TextStyle()),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<InstagramViewModel>(context,
                                      listen: false)
                                  .animateContainer(context);
                            },
                            icon: Provider.of<InstagramViewModel>(context,
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
                        height: Provider.of<InstagramViewModel>(context,
                                    listen: false)
                                .selectedDrafts
                            ? MediaQuery.of(context).size.height * 0.15
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
                                controller: viewModel.instagramAudience,
                                autofocus: false,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  labelStyle: TextStyle(fontSize: 13),
                                  hintText: 'blog writers and marketers',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01,
                              ),
                              Text('Brand'),
                              SizedBox(
                                height: 5,
                              ),
                              TextField(
                                controller: viewModel.instagramBrand,
                                autofocus: false,
                                minLines: 1,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(10),
                                  isDense: true,
                                  filled: true,
                                  fillColor: Color.fromARGB(
                                    255,
                                    255,
                                    255,
                                    255,
                                  ),
                                  labelStyle: TextStyle(fontSize: 13),
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
                          onPressed: viewModel
                                      .instagramProduct.text.isNotEmpty &&
                                  Provider.of<InstagramViewModel>(context)
                                      .instagramKeywordsList
                                      .isNotEmpty
                              ? () {
                                  Provider.of<InstagramViewModel>(context,
                                          listen: false)
                                      .instaPost(
                                    product: viewModel.instagramProduct.text,
                                    keywords: viewModel.instagramKeywordsList
                                        .toString(),
                                    toneId: viewModel.selectedToneId,
                                    audience: viewModel.instagramAudience.text,
                                    brand: viewModel.instagramBrand.text,
                                  );
                                }
                              : null,
                          child: Selector<InstagramViewModel, bool>(
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
                Consumer<InstagramViewModel>(
                  builder: (context, state, child) {
                    return state.isDataAvailable
                        ? tabViews(context, state)
                        : NoContent();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column tabViews(BuildContext context, InstagramViewModel viewmodel) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.0,
          child: Row(
            children: [
              TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                  color: Color.fromARGB(255, 233, 236, 239),
                ),
                isScrollable: true,
                tabs: [
                  Tab(
                      child: Text(
                    'Edit',
                    style: TextStyle(color: Colors.black),
                  )),
                  Tab(
                      child: Text(
                    'Preview',
                    style: TextStyle(color: Colors.black),
                  )),
                ],
              ),
              SizedBox(
                width: 110,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/icons/refresh.svg'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Reset All',
                          style: TextStyle(
                              fontSize: 12,
                              color: const Color.fromARGB(255, 203, 72, 72)),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 233, 236, 239),
                            borderRadius: BorderRadius.circular(5)),
                        height: 20,
                        width: 25,
                        child: Center(child: Text('5')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.4,
          child: TabBarView(
            children: [
              ListView.builder(
                itemCount: viewmodel.instaModel.data!.instaCaptions!.length,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CaptionEditWidget(
                      contents: viewmodel
                          .instaModel.data!.instaCaptions![index].instaCaption!,
                    ),
                  );
                },
              ),
              ListView.builder(
                itemCount: 5,
                physics: const ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: CaptionPreviewWidget(
                      previewContents: viewmodel
                          .instaModel.data!.instaCaptions![index].instaCaption!,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
