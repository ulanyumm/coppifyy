import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:hypotenuse/widgets/drawerMenu.dart';
import 'package:hypotenuse/widgets/plansAndPricing/plansTabBar.dart';

class PlansAndPricingScreen extends StatefulWidget {
  const PlansAndPricingScreen({super.key});

  @override
  State<PlansAndPricingScreen> createState() => _PlansAndPricingScreenState();
}

class _PlansAndPricingScreenState extends State<PlansAndPricingScreen> {
  PricingPageViewModel viewModel = PricingPageViewModel();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: RichText(
            text: const TextSpan(children: [
          TextSpan(
              text: 'Plans and pricing',
              style: TextStyle(fontSize: 30, color: Colors.black)),
          TextSpan(
              text: '    Start small and scale up as you need.',
              style: TextStyle(color: Colors.grey)),
        ])),
      ),
      key: _scaffoldKey,
      drawer: const DrawerMenu(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: () {
          _scaffoldKey.currentState!.openDrawer();
        },
        child: SvgPicture.asset("assets/images/icons/logo1.svg", height: 60),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: FutureBuilder(
        future: viewModel.paymentProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.8,
                      child: PlansTabBar(
                        month: viewModel.month,
                        annual: viewModel.annual,
                        paymentProductData: viewModel.paymentProductData,
                      ),
                    ),
                  ]),
            );
          } else {
            return const Text("errror");
          }
        },
      ),
    );
  }
}
