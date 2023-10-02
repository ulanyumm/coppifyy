import 'package:flutter/material.dart';
import 'package:hypotenuse/screen/auth/landingPage.dart';
import 'package:hypotenuse/screen/templates/ads&social/DiscountSpecialOffer/discountSpecial_viewmodel.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticleOutlineAdd_viewModel.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticleOutlineCreate_viewModel.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticleTitle_viewModel.dart';
import 'package:hypotenuse/screen/templates/blogcontent/ArticleGenerator/articleGenerator_viewmodel.dart';
import 'package:hypotenuse/screen/templates/general/AskAIAnyThing/askAnyThing_viewmodel.dart';
import 'package:hypotenuse/screen/auth/auth_viewModel.dart';
import 'package:hypotenuse/viewmodel/Blog%20Article%20/blogArticlePost_viewmodel.dart';
import 'package:hypotenuse/screen/templates/general/BlogIdeas/blogIdeas_viewmodel.dart';
import 'package:hypotenuse/screen/templates/ads&social/ContestGiveway/contestGiveway_viewmodel.dart';
import 'package:hypotenuse/viewmodel/copiMage_viewmodeli.dart';
import 'package:hypotenuse/screen/templates/general/EcommerceProduct/ecommerceProduct_viewmodel.dart';
import 'package:hypotenuse/viewmodel/forgotPassword_viewModel.dart';
import 'package:hypotenuse/screen/templates/ads&social/GoogleAds/googleAds_viewmodel.dart';
import 'package:hypotenuse/screen/templates/ads&social/InstagramCaptions/instagram_viewmodel.dart';
import 'package:hypotenuse/screen/templates/general/JobAdvertisement/jobAdvertisement_viewModel.dart';
import 'package:hypotenuse/screen/templates/general/MarketingAngels/marketingAngles_viewmodel.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:hypotenuse/screen/templates/general/RewriteContent/rewritecontent_viewmodel.dart';
import 'package:hypotenuse/viewmodel/settings_viewmodel.dart';
import 'package:hypotenuse/screen/templates/site/SocialMediaBioWriters/socialmediaBio_viewmodel.dart';
import 'package:hypotenuse/screen/templates/general/SummarizeContent/summarizeContent_viewmodel.dart';
import 'package:hypotenuse/screen/templates/general/ValueProposition/valueProposition_viewmodel.dart';
import 'package:hypotenuse/screen/templates/ads&social/VideoHookProduction/videoHook_viewmodel.dart';
import 'package:hypotenuse/screen/templates/site/VisionStatement/visionStatement_viewmodel.dart';
import 'package:hypotenuse/screen/templates/site/WebSiteHeadlineSlogans/websiteheadlinesviewmodel.dart';
import 'package:hypotenuse/screen/templates/NewsletterCommons/WelcommingConfirmationEmail/welcomingemail_viewmodel.dart';
import 'package:hypotenuse/viewmodel/zemin_viewmodel.dart';
import 'package:hypotenuse/widgets/plansAndPricing/price_test/maintest.dart';
import 'package:provider/provider.dart';
import 'purchase/purchases_provider.dart';
import 'screen/templates/site/BioWriters/biowriters_viewmodel.dart';
import 'screen/templates/site/CategoryPageDescriptions/categoryPage_viewmodel.dart';
import 'viewmodel/dashboaard_viewmodel.dart';
import 'screen/templates/NewsletterCommons/EmailCopy/emailCopy_viewmodel.dart';
import 'screen/templates/NewsletterCommons/EventPromotionEmail/eventPromotion_viewmodel.dart';
import 'screen/templates/ads&social/FacebookAds/facebookAds_viewmodel.dart';
import 'screen/templates/site/Faq/faq_modelview.dart';
import 'viewmodel/general_viewModel.dart';
import 'screen/templates/site/LandingPageContent/landingPage_viewmodel.dart';
import 'screen/templates/ads&social/LinkedinPost/linkedinPost_viewmodel.dart';
import 'screen/auth/Login/login_viewmodel.dart';
import 'screen/templates/site/MetaTitlesDescriptions/metatitles_viewmolde.dart';
import 'screen/templates/site/MissionStatement/misionStatement_viewmodel.dart';
import 'viewmodel/plansAndPricing_ViewModel.dart';
import 'screen/templates/NewsletterCommons/PressRelease/pressreleases_viewmodel.dart';
import 'screen/templates/ads&social/TwitterScreen/twitter_viewmodel.dart';
import 'screen/templates/ads&social/VideoTimeLineTool/videoTimeline_viewmodel.dart';
import 'screen/templates/ads&social/YoutubeTitlesDescriptions/youtubeTitles_viewmodels.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => InstagramViewModel()),
        ChangeNotifierProvider(create: (_) => AskAnyThingViewModel()),
        ChangeNotifierProvider(create: (_) => RewriteContentViewModel()),
        ChangeNotifierProvider(create: (_) => SummarizeContentViewModel()),
        ChangeNotifierProvider(create: (_) => MarketingAnglesViewModel()),
        ChangeNotifierProvider(create: (_) => EcommerceProductViewModel()),
        ChangeNotifierProvider(create: (_) => JobAdvertisementViewModel()),
        ChangeNotifierProvider(create: (_) => ValuePropositionViewModel()),
        ChangeNotifierProvider(create: (_) => BlogIdeasViewModel()),
        ChangeNotifierProvider(create: (_) => GoogleAdsViewModel()),
        ChangeNotifierProvider(create: (_) => FacebookAdsViewModel()),
        ChangeNotifierProvider(create: (_) => LinkedinPostsViewModel()),
        ChangeNotifierProvider(create: (_) => YoutubeTitlesViewModel()),
        ChangeNotifierProvider(create: (_) => VideoHookViewModel()),
        ChangeNotifierProvider(create: (_) => DiscountSpecialViewModel()),
        ChangeNotifierProvider(create: (_) => ContestGiveViewModel()),
        ChangeNotifierProvider(create: (_) => TwitterPostviewModel()),
        ChangeNotifierProvider(create: (_) => VideoTimelineViewModel()),
        ChangeNotifierProvider(create: (_) => WebsiteHeadlinesViewModel()),
        ChangeNotifierProvider(create: (_) => LandingPageContentViewModel()),
        ChangeNotifierProvider(create: (_) => MetaTitlesPostViewModel()),
        ChangeNotifierProvider(create: (_) => CategoryPageViewModel()),
        ChangeNotifierProvider(create: (_) => BioWritersViewModel()),
        ChangeNotifierProvider(create: (_) => VisionStatementViewModel()),
        ChangeNotifierProvider(create: (_) => MisionStatementViewModel()),
        ChangeNotifierProvider(create: (_) => FaqsScreenModelView()),
        ChangeNotifierProvider(create: (_) => SocialMediaBioViewModel()),
        ChangeNotifierProvider(create: (_) => PressReleasesViewModel()),
        ChangeNotifierProvider(create: (_) => EmailCopyViewModel()),
        ChangeNotifierProvider(create: (_) => EventPromotionViewModel()),
        ChangeNotifierProvider(
            create: (_) => WelcomingConfirmationEmailViewModel()),
        ChangeNotifierProvider(create: (_) => GeneralModelViewModel()),
        ChangeNotifierProvider(create: (_) => ArticleGeneratorViewModel()),
        ChangeNotifierProvider(create: (_) => BlogArticleProjectViewModel()),
        ChangeNotifierProvider(create: (_) => CopiMageViewModel()),
        ChangeNotifierProvider(create: (_) => ForgotPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => SettingsScreenViewModel()),
        ChangeNotifierProvider(create: (_) => PlansAndPricingViewModel()),
        ChangeNotifierProvider(create: (_) => BlogArticleTitleViewModel()),
        ChangeNotifierProvider(create: (_) => BlogArticleOutlineAddViewModel()),
        ChangeNotifierProvider(
            create: (_) => BlogArticleOutlineCreateViewModel()),
        ChangeNotifierProvider(create: (_) => PricingPageViewModel()),
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => ZeminViewModel()),
        ChangeNotifierProvider(create: (_) => DashboardViewModel()),
        ChangeNotifierProvider(create: (_) => PurchaseProvider()),
      ],
      //child: const MyApp(),
      child: MainTest(),
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
      home: const LandingPage(),
    );
  }
}
