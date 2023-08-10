import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/splashScreen.dart';
import 'package:hypotenuse/viewmodel/askAnyThing_viewmodel.dart';
import 'package:hypotenuse/viewmodel/blogIdeas_viewmodel.dart';
import 'package:hypotenuse/viewmodel/ecommerceProduct_viewmodel.dart';
import 'package:hypotenuse/viewmodel/googleAds_viewmodel.dart';
import 'package:hypotenuse/viewmodel/instagram_viewmodel.dart';
import 'package:hypotenuse/viewmodel/jobAdvertisement_viewModel.dart';
import 'package:hypotenuse/viewmodel/rewritecontent_viewmodel.dart';
import 'package:hypotenuse/viewmodel/valueProposition_viewmodel.dart';
import 'package:hypotenuse/viewmodel/videoHook_viewmodel.dart';
import 'package:provider/provider.dart';

import 'viewmodel/facebookAds_viewmodel.dart';
import 'viewmodel/linkedinPost_viewmodel.dart';
import 'viewmodel/youtubeTitles_viewmodels.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstagramViewModel()),
        ChangeNotifierProvider(create: (_) => AskAnyThingViewModel()),
        ChangeNotifierProvider(create: (_) => RewriteContentViewModel()),
        ChangeNotifierProvider(create: (_) => EcommerceProductViewModel()),
        ChangeNotifierProvider(create: (_) => JobAdvertisementViewModel()),
        ChangeNotifierProvider(create: (_) => ValuePropositionViewModel()),
        ChangeNotifierProvider(create: (_) => BlogIdeasViewModel()),
        ChangeNotifierProvider(create: (_) => GoogleAdsViewModel()),
        ChangeNotifierProvider(create: (_) => FacebookAdsViewModel()),
        ChangeNotifierProvider(create: (_) => LinkedinPostsViewModel()),
        ChangeNotifierProvider(create: (_) => YoutubeTitlesViewModel()),
        ChangeNotifierProvider(create: (_) => VideoHookViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Inter'),
      debugShowCheckedModeBanner: false,
      title: 'Copify',
      home: SplashScreen(),
    );
  }
}
