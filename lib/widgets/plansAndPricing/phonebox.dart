import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:provider/provider.dart';

class PhoneBoxField extends StatelessWidget {
  const PhoneBoxField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<PricingPageViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone Number',
          style: TextStyle(color: Colors.grey),
        ),
        Container(
          decoration: const BoxDecoration(),
          child: Stack(
            children: [
              Positioned(
                bottom: 10,
                top: 10,
                left: 0,
                child: Container(
                  height: 30,
                  width: 80,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Row(
                    children: [
                      Spacer(),
                      Icon(
                        CupertinoIcons.chevron_down,
                        size: 16,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                child: InternationalPhoneNumberInput(
                  onInputChanged: (PhoneNumber number) {
                    viewmodel.phoneNumberCountryCode =
                        number.dialCode!.toString();
                  },
                  onInputValidated: (bool value) {},
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: const TextStyle(
                    color: Colors.black,
                  ),
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                    setSelectorButtonAsPrefixIcon: false,
                    leadingPadding: 10,
                    showFlags: false,
                    trailingSpace: true,
                  ),
                  initialValue: PhoneNumber(isoCode: 'TR'),
                  textFieldController: viewmodel.phoneController,
                  maxLength: 10,
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputDecoration: const InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.all(8),
                    border: OutlineInputBorder(),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                  ),
                  textStyle: const TextStyle(color: Colors.black),
                  onSaved: (PhoneNumber number) {},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
