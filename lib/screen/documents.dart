import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/model/documents_viewmodel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';

class DocumentsScreen extends StatefulWidget {
  const DocumentsScreen({super.key});

  @override
  State<DocumentsScreen> createState() => _DocumentsScreenState();
}

class _DocumentsScreenState extends State<DocumentsScreen> {
  DocumentsViewModel viewModel = DocumentsViewModel();
  @override
  Widget build(BuildContext context) {
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Write Your First Article',
                style: UIHelper.getAnaBaslikTextStyle()),
            const Text('Get creative with our AI and start writing.'),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.grey),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text('Blog Generator',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.04,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
                child: ElevatedButton(
                  style: const ButtonStyle(
                    side: MaterialStatePropertyAll(
                      BorderSide(width: 1, color: Colors.grey),
                    ),
                    elevation: MaterialStatePropertyAll(0),
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: () {},
                  child: const Text('ArticLe Generator',
                      style: TextStyle(color: Colors.black)),
                ),
              )
            ])
          ],
        ));
  }
}
