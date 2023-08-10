import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/blogIdeas_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class BlogIdeas extends StatefulWidget {
  const BlogIdeas({super.key});

  @override
  State<BlogIdeas> createState() => _BlogIdeasState();
}

class _BlogIdeasState extends State<BlogIdeas> {
  BlogIdeasViewModel viewModel = BlogIdeasViewModel();

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
                  Text('Blog Ideas', style: UIHelper.getAnaBaslikTextStyle()),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Text(
                    "Don't know what to tweet? Get ideas for tweets that will engage your followers.",
                    style: UIHelper.getIcerikTextStyle(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    'What is this blog about? *',
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
                        TextFormField(
                          maxLength: 1000,
                          onChanged: (value) {
                            setState(() {});
                          },
                          controller: viewModel.blogAbout,
                          autofocus: false,
                          minLines: 4,
                          decoration: InputDecoration(
                            isDense: true,
                            filled: true,
                            fillColor: UIHelper.fillColor(),
                            hintText: "tesla cars",
                            labelStyle: TextStyle(fontSize: 13),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.035,
                        ),
                        Container(
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.035,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UIHelper.activeButtonColor(),
                            ),
                            onPressed:
                                viewModel.blogAbout.text.isEmpty ? null : () {},
                            child: Selector<BlogIdeasViewModel, bool>(
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
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Consumer<BlogIdeasViewModel>(
                    builder: (context, state, child) {
                      return state.isDataAvailable ? Container() : NoContent();
                    },
                  ),
                ]))));
  }
}
