import 'package:flutter/material.dart';
import 'package:hypotenuse/widgets/plansAndPricing/copifyMonth_widget.dart';
import 'package:hypotenuse/model/plansProduct_model.dart';
import 'package:hypotenuse/widgets/plansAndPricing/copifyannual_widget.dart';

class PlansTabBar extends StatefulWidget {
  final PlansProductModel paymentProductData;
  final List<PricingPlans> month;
  final List<PricingPlans> annual;
  const PlansTabBar({
    Key? key,
    required this.paymentProductData,
    required this.month,
    required this.annual,
  }) : super(key: key);
  @override
  _PlansTabBarState createState() => _PlansTabBarState();
}

class _PlansTabBarState extends State<PlansTabBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool selectedDrafts = false;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
      ),
      child: Column(children: [
        Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(
              12.0,
            ),
          ),
          child: Center(
            child: TabBar(
              isScrollable: true,
              padding: const EdgeInsets.all(7),
              controller: tabController,
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.0,
                ),
                color: Colors.white,
              ),
              tabs: [
                Tab(
                  child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.05,
                      child: const Center(
                        child: Text(
                          'Monthly',
                          style: TextStyle(color: Colors.black),
                        ),
                      )),
                ),
                const Tab(
                  child: SizedBox(
                      height: 30,
                      child: Row(
                        children: [
                          Text(
                            'Annual ',
                            style: TextStyle(color: Colors.black),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: tabController,
            children: [
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.month.length,
                addAutomaticKeepAlives: false,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                addRepaintBoundaries: false,
                itemBuilder: (context, index) {
                  PricingPlans plan = widget.month[index];

                  return CopifyMonth(
                    text: plan.name!,
                    credit: plan.credit!,
                    price: plan.price!,
                    id: plan.id!,
                    paymentInterval: plan.paymentInterval!,
                  );
                },
              ),

              /* child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Copify(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Copifyer(),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Copifyest(),
                          SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text('Frequently asked questions',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
                          FrequentlyAskedQuestionsWidget(),
                        ]),
                  ),
                ),
              ), */
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: widget.annual.length,
                addAutomaticKeepAlives: false,
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                addRepaintBoundaries: false,
                itemBuilder: (context, index) {
                  PricingPlans plan = widget.annual[index];
                  return CopifyAnnual(
                    text: plan.name!,
                    credit: plan.credit!,
                    price: plan.price!,
                    paymentInterval: plan.paymentInterval!,
                    id: plan.id!,
                  );
                },
              ),
              // second tab bar view widget
              // SingleChildScrollView(
              //   child: Padding(
              //     padding: const EdgeInsets.only(left: 10, right: 10),
              //     child: Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           CopifyAnnual(),
              //           SizedBox(
              //             height: MediaQuery.of(context).size.height * 0.02,
              //           ),
              //           CopifyerAnnual(),
              //           SizedBox(
              //             height: MediaQuery.of(context).size.height * 0.02,
              //           ),
              //           CopifyestAnnual(),
              //           SizedBox(
              //             height: 40,
              //           ),
              //           Center(
              //             child: Text('Frequently asked questions',
              //                 style: TextStyle(
              //                     fontSize: 20, fontWeight: FontWeight.bold)),
              //           ),
              //           FrequentlyAskedQuestionsWidget(),
              //         ]),
              //   ),
              // ),
            ],
          ),
        ),
      ]),
    );
  }
}
