import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/screen/templates/general/BlogIdeas/blogIdeas_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/answers/mulitanswer.dart';
import 'package:hypotenuse/widgets/not_content.dart';
import 'package:provider/provider.dart';

class BlogIdeas extends StatefulWidget {
  const BlogIdeas({super.key});

  @override
  State<BlogIdeas> createState() => _BlogIdeasState();
}

class _BlogIdeasState extends State<BlogIdeas> {
  BlogIdeasViewModel vmodel = BlogIdeasViewModel();
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
    var viewModel = Provider.of<BlogIdeasViewModel>(context);
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
                  const SizedBox(
                    height: 5,
                  ),
                  Form(
                    key: viewModel.formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          onTapOutside: ((event) {
                            FocusScope.of(context).unfocus();
                          }),
                          onChanged: (value) {
                            Provider.of<BlogIdeasViewModel>(context,
                                    listen: false)
                                .checkActiveButton();
                          },
                          maxLength: 1000,
                          controller: viewModel.blogAbout,
                          autofocus: false,
                          minLines: 4,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(
                              MediaQuery.of(context).size.height * 0.009,
                            ),
                            isDense: true,
                            filled: true,
                            fillColor: UIHelper.fillColor(),
                            hintText: "tesla cars",
                            labelStyle: const TextStyle(fontSize: 13),
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
                            onPressed: viewModel.blogAbout.text.isEmpty
                                ? null
                                : () {
                                    Provider.of<BlogIdeasViewModel>(context,
                                            listen: false)
                                        .blogIdeaPost(
                                            about: viewModel.blogAbout.text);
                                  },
                            child: Selector<BlogIdeasViewModel, bool>(
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
                    height: MediaQuery.of(context).size.height * 0.04,
                  ),
                  Consumer<BlogIdeasViewModel>(
                    builder: (context, state, child) {
                      return viewModel.dataList.isNotEmpty
                          ? SizedBox(
                              height: 400,
                              child: ListView.builder(
                                  itemCount: viewModel.dataList.length,
                                  itemBuilder: (context, index) {
                                    return MultiAnsverScreen(
                                      contents: viewModel.dataList[index]
                                          .descriptions!.description
                                          .toString(),
                                      named: 'Blog Idea',
                                      onDismiss: () {
                                        viewModel.removeWidget(
                                            viewModel.dataList[index]);
                                      },
                                      id: viewModel
                                          .dataList[index].descriptions!.id!,
                                    );
                                  }),
                            )
                          : const NoContent();
                    },
                  ),
                ]))));
  }
}
