import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';

class CaptionPreviewWidget extends StatefulWidget {
  CaptionPreviewWidget({
    Key? key,
    required this.previewContents,
  }) : super(key: key);
  String previewContents;
  @override
  State<CaptionPreviewWidget> createState() => _CaptionPreviewWidgetState();
}

class _CaptionPreviewWidgetState extends State<CaptionPreviewWidget> {
  SettingsScreenViewModel viewModel = SettingsScreenViewModel();

  String accountName = 'ulanyum@mail.ru';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: viewModel.showUserData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 2,
                        child: Column(children: [
                          ListTile(
                            visualDensity: const VisualDensity(
                              vertical: -2,
                            ),
                            leading: CircleAvatar(
                              child: ProfilePicture(
                                  random: true,
                                  name: viewModel
                                      .showAuthModel.data!.user!.firstName
                                      .toString(),
                                  radius: 31,
                                  fontsize: 21),
                            ),
                            title: Text(
                                '${viewModel.showAuthModel.data!.user!.firstName}',
                                style: const TextStyle(fontSize: 11)),
                            subtitle: const Text('Sponsored',
                                style: TextStyle(fontSize: 10)),
                          ),
                          Image.asset(
                            'assets/images/default-image.png',
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 20,
                            child: Padding(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('Shop Now'),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 15,
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Divider(),
                          const SizedBox(
                            height: 5,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 8, right: 8),
                            child: Row(children: [
                              Icon(Icons.favorite_border),
                              Icon(Icons.chat_bubble_outline_sharp),
                              Icon(Icons.near_me_outlined),
                            ]),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RichText(
                                text: TextSpan(
                                    text: '{$accountName}',
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: widget.previewContents,
                                    style: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  )
                                ])),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_up_outlined,
                                    size: 15,
                                  )),
                              IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.thumb_down_outlined,
                                    size: 15,
                                  )),
                              IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                  icon: const Icon(Icons.copy, size: 15)),
                              IconButton(
                                  visualDensity: VisualDensity.compact,
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.delete_outlined,
                                    size: 15,
                                  )),
                            ],
                          ),
                        ]),
                      )
                    ]));
          } else {
            return const Text("Error");
          }
        });
  }
}
