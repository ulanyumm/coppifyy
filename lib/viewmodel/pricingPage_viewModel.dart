import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hypotenuse/core/creditCardNorm.dart';
import 'package:hypotenuse/model/payment_model.dart';
import 'package:hypotenuse/model/plansId_model.dart';
import 'package:hypotenuse/model/plansProduct_model.dart';
import 'package:hypotenuse/model/showAuth_model.dart';
import 'package:hypotenuse/screen/auth/auth_service.dart';
import 'package:hypotenuse/service/payment_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PricingPageViewModel extends ChangeNotifier {
  String phoneNumberCountryCode = "90";
  TextEditingController cardNumberController = TextEditingController();
  TextEditingController cardHolderController = TextEditingController();
  TextEditingController expirationDateController = TextEditingController();
  TextEditingController cvvController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController expireMonthController = TextEditingController();
  TextEditingController expireYearController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController zipCodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  bool isLoading = false;
  CopifyServicePaymentService service = CopifyServicePaymentService();
  CardType cardType = CardType.Invalid;
  PaymentCard paymentCard = PaymentCard();
  PaymentCard card = PaymentCard();
  String? mm;
  String? yy;
//in_app_purchase ayarları
  /*  InAppPurchase inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<dynamic> streamSubscription;
  List<ProductDetails> products = [];
  static const variant = {
    "Copify",
    "Copifyer",
    "Copifyest",
    "Copify Annual",
    "Copifyer Annual",
    "Copifyest Annual"
  };
  bool isloading = false;
  initStore() async {
    ProductDetailsResponse productDetailsResponse =
        await inAppPurchase.queryProductDetails(variant);
    if (productDetailsResponse.error == null) {
      products = productDetailsResponse.productDetails;
      notifyListeners();
    }
  }

  buy() {
    final PurchaseParam param = PurchaseParam(productDetails: products[0]);
    inAppPurchase.buyConsumable(purchaseParam: param);
    notifyListeners();
  }

  void listenToPurchase(
      List<PurchaseDetails> purchaseDetailsList, BuildContext context) {
    purchaseDetailsList.forEach((PurchaseDetails purchaseDetails) async {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Pending")));
      } else if (purchaseDetails.status == PurchaseStatus.error) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Error")));
      } else if (purchaseDetails.status == PurchaseStatus.purchased) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Purchased")));
      }
    });
  }
 */
  PlansProductModel paymentProductData = PlansProductModel();
//Adress bilgileri

  void getCardTypeFrmNumber() {
    if (cardNumberController.text.length <= 6) {
      String input = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(input);
      if (type != cardType) {
        cardType = type;
        notifyListeners();
      }
    }
  }

  void showInSnackBar(BuildContext context, String value) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(value),
      duration: const Duration(seconds: 3),
    ));
  }

// Bütün alanlar için ayrı ayrı validatör yazılacak
  void validateInputsCardNumber() {
    final FormState form = formKey.currentState!;
    form.validate();
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode
          .onUserInteraction; // Start validating on every change.
      notifyListeners();
      /*  showInSnackBar(
          form.context, 'Please fix the errors in red before submitting.'); */
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      showInSnackBar(form.context, 'Payment card is valid');
    }
  }

  void validateInputsCardDate(String? mm, String? yy) {
    final FormState form = formKey.currentState!;
    form.validate();
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode
          .onUserInteraction; // Start validating on every change.
      /*  notifyListeners(); */
      /*   showInSnackBar(
          form.context, 'Please fix the errors in red before submitting.'); */
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      showInSnackBar(form.context, 'Payment card is valid');
    }
  }

  void validateInputsCardCvv() {
    final FormState form = formKey.currentState!;
    form.validate();
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode
          .onUserInteraction; // Start validating on every change.
      notifyListeners();
      /*  showInSnackBar(
          form.context, 'Please fix the errors in red before submitting.'); */
    } else {
      form.save();
      // Encrypt and send send payment details to payment gateway
      showInSnackBar(form.context, 'Payment card is valid');
    }
  }

  void buttonValidation() {
    final FormState form = formKey.currentState!;
    form.validate();
    if (!form.validate()) {
      autoValidateMode = AutovalidateMode.onUserInteraction;
      notifyListeners();
      showInSnackBar(
          form.context, 'Please fix the errors in red before submitting.');
    } else {
      form.save();
      // Encrypt and send send payment details to the payment gateway
      showInSnackBar(form.context, 'Payment card is valid');
    }
  }

  List<PricingPlans> annual = [];
  List<PricingPlans> month = [];

  Future paymentProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.getProductPost(token);

    if (response.result!) {
      paymentProductData = response;

      for (var i = 0;
          i < paymentProductData.data!.product!.pricingPlans!.length;
          i++) {
        if (paymentProductData
                .data!.product!.pricingPlans![i].paymentInterval ==
            "MONTHLY") {
          month.add(paymentProductData.data!.product!.pricingPlans![i]);
        } else {
          annual.add(paymentProductData.data!.product!.pricingPlans![i]);
        }
      }
    }
  }

  PaymentPageModel datamodel = PaymentPageModel();
  Future postTransactions({
    required String name,
    required String surname,
    required String email,
    required String gsmNumber,
    required String pricingPlanId,
    required String cardHolderName,
    required String cardNumber,
    required String expireMonth,
    required String expireYear,
    required String cvc,
    required String billingContactName,
    required String billingCity,
    required String billingDistrict,
    required String billingCountry,
    required String billingAddress,
    required String billingZipCode,
    required String shippingContactName,
    required String shippingCity,
    required String shippingDistrict,
    required String shippingCountry,
    required String shippingAddress,
    required String shippingZipCode,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await service.postservice(
      token,
      {
        "name": name,
        "surname": surname,
        "email": email,
        "gsmNumber": phoneNumberCountryCode.substring(1) + gsmNumber,
        "pricingPlanId": pricingPlanId,
        "cardHolderName": cardHolderName,
        "cardNumber": cardNumber,
        "expireMonth": expireMonth,
        "expireYear": expireYear,
        "cvc": cvc,
        "billingContactName": billingContactName,
        "billingCity": billingCity,
        "billingDistrict": billingDistrict,
        "billingCountry": billingCountry,
        "billingAddress": billingAddress,
        "billingZipCode": billingZipCode,
        "shippingContactName": shippingContactName,
        "shippingCity": shippingCity,
        "shippingDistrict": shippingDistrict,
        "shippingCountry": shippingCountry,
        "shippingAddress": shippingAddress,
        "shippingZipCode": shippingZipCode
      },
    );

    if (response.result!) {
      // Work
      datamodel = response;

      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }

  PaymentsUpdateModel paymentsUpdateModel = PaymentsUpdateModel();
  Future postUpdate({
    required String pricingPlanId,
  }) async {
    isLoading = true;
    notifyListeners();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.postservice(
      token,
      {
        "pricingPlanId": pricingPlanId,
      },
    );

    if (response.result!) {
      // Work
      datamodel = response;
      isLoading = false;
      notifyListeners();
    } else {
      isLoading = true;
      // Error
    }
  }

  ShowAuthModel showAuthModel = ShowAuthModel();
  final AuthService _service = AuthService();

  Future showUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await _service.showUser(token);

    if (response.result!) {
      showAuthModel = response;
      /*  notifyListeners(); */
    } else {}
  }
}
