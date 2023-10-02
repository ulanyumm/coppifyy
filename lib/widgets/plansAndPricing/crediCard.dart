import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/core/creditCardNorm.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:hypotenuse/widgets/buttons/paysButton.dart';
import 'package:provider/provider.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PricingPageViewModel pricingViewModel = PricingPageViewModel();
  String? mm;
  String? yy;

  @override
  void initState() {
/*     Provider.of<PricingPageViewModel>(context, listen: false)
        .cardNumberController
        .addListener(() {
      Provider.of<PricingPageViewModel>(context, listen: false)
          .getCardTypeFrmNumber();
    }); */
    super.initState();
  }

  @override
  void dispose() {
    pricingViewModel.cardNumberController
        .removeListener(pricingViewModel.getCardTypeFrmNumber);
    pricingViewModel.dispose();
    super.dispose();
  }

  /* PricingPageViewModel viewModel = PricingPageViewModel(); */

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
    viewModel.zipCodeController.text = "16040"; */
    return Form(
      key: viewModel.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Credit Card Number (Only for Credit Card)'),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            onEditingComplete: () {
              FocusScope.of(context).nextFocus(); // Diğer alana geçiş yap
            },
            controller: viewModel.cardNumberController,
            onSaved: (String? value) {
              viewModel.paymentCard.number = CardUtils.getCleanedNumber(value!);
            },
            validator: CardUtils.validateCardNum,
            onChanged: (value) {
              viewModel.validateInputsCardNumber();
            },
            autofocus: false,
            minLines: 1,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
            decoration: InputDecoration(
              suffix: CardUtils.getCardIcon(
                viewModel.cardType,
              ),
              isDense: true,
              contentPadding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.009,
              ),
              filled: true,
              fillColor: UIHelper.fillColor(),
              labelStyle: const TextStyle(fontSize: 13),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: TextInputType.number,
            maxLines: null,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          const Text('Card Holder'),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            onEditingComplete: () {
              FocusScope.of(context).nextFocus(); // Diğer alana geçiş yap
            },
            onSaved: (String? value) {
              viewModel.card.name = value;
            },
            validator: (String? value) =>
                value!.isEmpty ? Strings.fieldReq : null,
            controller: viewModel.cardHolderController,
            autofocus: false,
            minLines: 1,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.all(
                MediaQuery.of(context).size.height * 0.009,
              ),
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
          Row(
            children: [
              const Text('Card Expiration Date'),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.07,
              ),
              const Text('CVV'),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus(); // Diğer alana geçiş yap
                  },
                  validator: (value) {
                    final parts = value!.split('/');
                    if (parts.length == 2) {
                      final mm = parts[0];
                      final yy = parts[1];
                      return CardUtils.validateExpirationDate(mm, yy);
                    }
                    return 'Invalid expiration date format (MM/YY)';
                  },
                  onSaved: (_) {
                    viewModel.validateInputsCardDate(mm, yy);
                  },
                  onChanged: (value) {
                    final parts = value.split('/');
                    if (parts.length == 2) {
                      mm = parts[0];
                      yy = parts[1];
                    }
                  },
                  controller: viewModel.expirationDateController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(5),
                    CardMonthInputFormatter(),
                  ],
                  autofocus: false,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "MM/YY",
                    isDense: true,
                    contentPadding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.009,
                    ),
                    filled: true,
                    fillColor: UIHelper.fillColor(),
                    labelStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: null,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.height * 0.06,
              ),
              Expanded(
                child: TextFormField(
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus(); // Diğer alana geçiş yap
                  },
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(3),
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  validator: CardUtils.validateCVV,
                  onSaved: (value) {
                    List<int> expiryDate = getExpiryDate(value!);
                    viewModel.paymentCard.month = expiryDate[0];
                    viewModel.paymentCard.year = expiryDate[1];
                  },
                  onChanged: (value) {
                    viewModel.validateInputsCardCvv();
                  },
                  controller: viewModel.cvvController,
                  autofocus: false,
                  minLines: 1,
                  decoration: InputDecoration(
                    hintText: "123",
                    isDense: true,
                    contentPadding: EdgeInsets.all(
                      MediaQuery.of(context).size.height * 0.009,
                    ),
                    filled: true,
                    fillColor: UIHelper.fillColor(),
                    labelStyle: const TextStyle(fontSize: 13),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  maxLines: null,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
        ],
      ),
    );
  }
}
