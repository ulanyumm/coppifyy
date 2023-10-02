import 'package:country_state_city_pro/country_state_city_pro.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:provider/provider.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/widgets/plansAndPricing/phonebox.dart';
import 'package:hypotenuse/widgets/plansAndPricing/crediCard.dart';

class PricingPage extends StatefulWidget {
  final String pricingData;
  final String totalPricingData;
  final String pricingName;
  final String id;

  const PricingPage({
    Key? key,
    required this.pricingData,
    required this.totalPricingData,
    required this.pricingName,
    required this.id,
  }) : super(key: key);

  @override
  State<PricingPage> createState() => _PricingPageState();
}

class _PricingPageState extends State<PricingPage> {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<PricingPageViewModel>(context);
    /*  viewModel.cardHolderController.text = "John Doel";
    viewModel.addressController.text = "Kent Sokak";
    viewModel.cityController.text = "İstanbul";
    viewModel.cardNumberController.text = "5400010000000004";
    viewModel.expirationDateController.text = "08/24";
    viewModel.cvcController.text = "123";
    viewModel.countryController.text = "Turkey";
    viewModel.stateController.text = "İstanbul";
    viewModel.zipCodeController.text = "16040";
 */
    return Scaffold(
      body: FutureBuilder(
        future: viewModel.showUserData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.connectionState == ConnectionState.done) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Plans & Pricing',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    const Text('Start small and scale up as you need'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('Card Information',
                        style: UIHelper.getAnaBaslikTextStyle()),
                    const Text(
                      'This information will be displayed publicly so be careful what you share.',
                      style: TextStyle(fontSize: 13),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const PaymentPage(),
                    const Text(
                      'Bling Adress',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    const Text(
                        'This information will be displayed publicly so be careful what you share.'),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const PhoneBoxField(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CountryStateCityPicker(
                      country: viewModel.countryController,
                      state: viewModel.stateController,
                      city: viewModel.cityController,
                      dialogColor: Colors.grey.shade200,
                      textFieldDecoration: InputDecoration(
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.009,
                        ),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: const TextStyle(fontSize: 13),
                        suffixIcon: const Icon(Icons.arrow_downward_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),

                    /*  Text('Country *'),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: viewModel.countryController,
                      onChanged: (value) {},
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.all(
                          MediaQuery.of(context).size.height * 0.009,
                        ),
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('City *'),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (value) {},
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text('State/Province'),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      onChanged: (value) {},
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(10),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ), */
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Text('Zip Code'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: viewModel.zipCodeController,
                      onChanged: (value) {},
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: const TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    const Text('Address'),
                    const SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: viewModel.addressController,
                      onChanged: (value) {},
                      autofocus: false,
                      minLines: 1,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(10),
                        isDense: true,
                        filled: true,
                        fillColor: UIHelper.fillColor(),
                        labelStyle: const TextStyle(fontSize: 13),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Order Summary',
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey)),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.pricingName,
                              ),
                              Text(
                                '\$${widget.pricingData}',
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.06,
                              )
                            ],
                          ),
                          const Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Total Amount',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text('\$${widget.totalPricingData}',
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                              const Divider()
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Center(
                              child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: ElevatedButton(
                                onPressed: () {
                                  Provider.of<PricingPageViewModel>(context, listen: false).postTransactions(
                                      name: viewModel
                                          .showAuthModel.data!.user!.firstName!,
                                      surname: viewModel
                                          .showAuthModel.data!.user!.lastName!,
                                      email: viewModel
                                          .showAuthModel.data!.user!.email!,
                                      gsmNumber: viewModel.phoneController.text,
                                      pricingPlanId: widget.id,
                                      cardHolderName:
                                          viewModel.cardHolderController.text,
                                      cardNumber:
                                          viewModel.cardNumberController.text,
                                      expireMonth: viewModel
                                          .expirationDateController.text
                                          .split('/')[0],
                                      expireYear: "20${viewModel
                                              .expirationDateController.text
                                              .split('/')[1]}",
                                      cvc: viewModel.cvcController.text,
                                      billingContactName: viewModel
                                              .showAuthModel
                                              .data!
                                              .user!
                                              .firstName! +
                                          viewModel.showAuthModel.data!.user!
                                              .lastName!,
                                      billingCity: viewModel.cityController.text,
                                      billingDistrict: viewModel.stateController.text,
                                      billingCountry: viewModel.countryController.text,
                                      billingAddress: viewModel.addressController.text,
                                      billingZipCode: viewModel.zipCodeController.text,
                                      shippingContactName: viewModel.showAuthModel.data!.user!.firstName! + viewModel.showAuthModel.data!.user!.lastName!,
                                      shippingCity: viewModel.cityController.text,
                                      shippingDistrict: viewModel.stateController.text,
                                      shippingCountry: viewModel.countryController.text,
                                      shippingAddress: viewModel.addressController.text,
                                      shippingZipCode: viewModel.zipCodeController.text);
                                },
                                child: const Text('Subscribe')),
                          )),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Text('error');
          }
        },
      ),
    );
  }
}
