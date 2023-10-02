import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticleOutlineCreate_viewModel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:provider/provider.dart';

class BlogArticleOutPut extends StatefulWidget {
  const BlogArticleOutPut({super.key});

  @override
  State<BlogArticleOutPut> createState() => _BlogArticleOutPutState();
}

class _BlogArticleOutPutState extends State<BlogArticleOutPut> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<BlogArticleOutlineCreateViewModel>(context);
    return Scaffold(
      key: viewModel.page3scaffoldkey,
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          viewModel.page3scaffoldkey.currentState!.openDrawer();
        },
        child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 44.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: viewModel.outlineList.map((outline) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Text(outline)),
                          IconButton(
                            onPressed: () {
                              final blogArticleProvider = Provider.of<
                                      BlogArticleOutlineCreateViewModel>(
                                  context,
                                  listen: false);
                              blogArticleProvider.removeItemOutlineList(
                                  viewModel.outlineList.indexOf(outline));
                            },
                            icon: const Icon(Icons.delete, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Consumer<BlogArticleOutlineCreateViewModel>(
                builder: (context, viewModel, child) {
                  return Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: TextField(
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(10),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.add_circle_outline),
                              onPressed: () {
                                final newItem =
                                    viewModel.outlineListAddController.text;
                                if (newItem.isNotEmpty) {
                                  Provider.of<
                                      BlogArticleOutlineCreateViewModel>(
                                    context,
                                    listen: false,
                                  ).addItemOutlineList(newItem, context);
                                  viewModel.outlineListAddController.text =
                                      ""; // Textfield'ı temizle
                                } else {
                                  //hata mesajı göster
                                }
                              },
                            ),
                          ),
                          controller: viewModel.outlineListAddController,
                        ),
                      ),
                    ],
                  );
                },
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.035,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: UIHelper.activeButtonColor(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8))),
                  onPressed: () {},
                  child: Selector<BlogArticleOutlineCreateViewModel, bool>(
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
      ),
    );
  }
}
