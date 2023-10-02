import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';

class FacebookAdsPreview extends StatefulWidget {
  FacebookAdsPreview({
    Key? key,
    required this.title,
    required this.contents,
  }) : super(key: key);
  String title;
  String contents;
  @override
  State<FacebookAdsPreview> createState() => _FacebookAdsPreviewState();
}

class _FacebookAdsPreviewState extends State<FacebookAdsPreview> {
  SettingsScreenViewModel viewModel = SettingsScreenViewModel();

  @override
  Widget build(BuildContext context) => FutureBuilder(
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
                          subtitle:
                              const Text('Sponsored', style: TextStyle(fontSize: 10)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(widget.contents),
                        ),
                        Image.asset(
                          'assets/images/default-image.png',
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8, right: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      viewModel
                                          .showAuthModel.data!.user!.firstName
                                          .toString(),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(widget.title,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.05,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.25,
                                height:
                                    MediaQuery.of(context).size.width * 0.08,
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                          const Color.fromARGB(255, 209, 213, 219),
                                        ),
                                        shape: MaterialStateProperty.all<
                                                RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ))),
                                    onPressed: () {},
                                    child: const Center(
                                      child: Text(
                                        'Shop Now',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 13),
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        const Divider(),
                      ]),
                    )
                  ]));
        } else {
          return const Text("Error");
        }
      });
}
