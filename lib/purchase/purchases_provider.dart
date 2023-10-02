import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypotenuse/model/plansProduct_model.dart';
import 'package:hypotenuse/model/showAuth_model.dart';
import 'package:hypotenuse/service/payment_service.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
//---

import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';

//import 'consumable_store.dart';

//---
class PurchaseProvider with ChangeNotifier {
  ShowAuthModel showAuthModel = ShowAuthModel();
  PlansProductModel plansProductModel = PlansProductModel();
  CopifyServicePaymentService service = CopifyServicePaymentService();
  PlansProductModel paymentProductData = PlansProductModel();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final InAppPurchase iap = InAppPurchase.instance;
  //-----

  //-----
  bool _available = false;
  List<ProductDetails> _products = [];
//kendi eklediklerim
  late StreamSubscription<dynamic> _streamSubscription;
  static const variant = {
    "Copify",
    "Copifyer",
    "Copifyest",
    "Copify Annual",
    "Copifyer Annual",
    "Copifyest Annual"
  };
// Kendi eklediklerim
  bool isLoading = false;

  bool get available => _available;
  List<ProductDetails> get products => _products;

  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;

  String _kConsumableId = 'consumable';
  String _kUpgradeId = 'upgrade';
  String _kMonthlySubscriptionId = 'copify_300cd_1m';
  String _kMonthlySubscriptionId2 = 'copifyer_700cd_1m';
  String _kMonthlySubscriptionId3 = 'copifyest_1100cd_1m';
  String _kAnnualSubscriptionId = 'copify_3600cd_1y';
  String _kAnnualSubscriptionId2 = 'copifyer_8400cd_1y';
  String _kAnnualSubscriptionId3 = 'copifyest_13200cd_1y';

  List<String> _notFoundIds = <String>[];
  //List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  List<String> _consumables = <String>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;
/*   List<String> _kProductIds = [
    _kMonthlySubscriptionId,
    _kMonthlySubscriptionId2,
    _kMonthlySubscriptionId3,
    _kAnnualSubscriptionId,
    _kAnnualSubscriptionId2,
    _kAnnualSubscriptionId3
  ]; */
  PurchaseProvider() {
    initialize();
    listenForPurchaseUpdates();
  }
  BuildContext? _context;

  set context(BuildContext value) {
    _context = value;
  }

  /* Future<PlansProductModel?> planlariGetir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;

    final response = await service.getProductPost(token);
    if (response.result!) {
      plansProductModel = response;
      notifyListeners();
      return plansProductModel;
    }
  } */
  Future<PlansProductModel?> planlariGetir() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString("token");

    if (token != null) {
      final response = await service.getProductPost(token);
      if (response.result!) {
        plansProductModel = response;
        notifyListeners();
        return plansProductModel;
      }
    }
    // Token yok veya response.result false ise null döndürün
    return null;
  }

  Future<void> initialize() async {
    _available = await iap.isAvailable();
    if (_available) {
      await _getProducts();
    }
    Stream purchaseUpdated = iap.purchaseStream;
  }

  Future<void> _getProducts() async {
    // burada ürünlerin id'lerini belirtiyoruz.
    final Set<String> ids = <String>{
      'copify_month',
      'copifyer_month',
      'copifyest_month',
      'copify_annual',
      'copifyer_annual',
      'copifyest_annual'
    };
    final ProductDetailsResponse response = await iap.queryProductDetails(ids);
    if (response.notFoundIDs.isEmpty) {
      _products = response.productDetails;
    }
    notifyListeners();
  }

  void changeLoading(bool value) {
    isLoading = value;
    notifyListeners();
  }

  Future paymentProduct() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString("token")!;
    final response = await service.getProductPost(token);

    if (response.result!) {
      paymentProductData = response;
      notifyListeners();
    }
  }

  Future<void> buyProduct(ProductDetails product) async {
    final PurchaseParam purchaseParam = PurchaseParam(productDetails: product);
    try {
      await iap.buyConsumable(purchaseParam: purchaseParam);

      // Satın alma işlemi başarıyla başlatıldı.

      // Satın alma işlemi başarıyla tamamlandığında işlemi bitir
      await _completePurchase(product, _context!);
    } catch (e) {
      if (e is PlatformException &&
          e.code == 'storekit_duplicate_product_object') {
        // Satın alma işlemi başarılı bir şekilde başlatıldıysa, resp değişkeni burada yazdırılabilir.
        final purchase = products.firstWhere(
          (purchase) => purchase.id == product.id,
        );
        await _completePurchase(purchase, _context!);
      } else {
        // Diğer hata durumları
        print("Satın alma hatası: $e");
      }
    }
  }

  Future<void> _completePurchase(dynamic purchase, BuildContext context) async {
    try {
      await iap.completePurchase(purchase);
    } catch (e) {
      /*  showTopSnackBar(
        Overlay.of(context),
        const CustomSnackBar.error(
          message:
              "Satın alma işlemi tamamlanamadı. Lütfen daha sonra tekrar deneyiniz.",
        ),
      ); */
    }
  }

  void listenForPurchaseUpdates() {
    final Stream<List<PurchaseDetails>> purchaseUpdatedStream =
        iap.purchaseStream;

    purchaseUpdatedStream
        .listen((List<PurchaseDetails> purchaseDetailsList) async {
      for (PurchaseDetails purchaseDetails in purchaseDetailsList) {
        if (purchaseDetails.status == PurchaseStatus.pending) {
          changeLoading(true);
          notifyListeners();
          // Satın alma işlemi bekliyor.
          print('Satın alma işlemi bekliyor: ${purchaseDetails.productID}');
        } else if (purchaseDetails.status == PurchaseStatus.error) {
          changeLoading(false);
          notifyListeners();
          // Satın alma işlemi hatası.

          print('Satın alma işlemi hatası: ${purchaseDetails.productID}');
          print('Hata mesajı: ${purchaseDetails.error!.message}');
          print('Hata mesajı: ${purchaseDetails.error!.code}');
          print('Hata mesajı: ${purchaseDetails.error!.details}');
          await _completePurchase(purchaseDetails, _context!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased) {
          changeLoading(false);
          notifyListeners();
          // Satın alma başarılı.
          print('Satın alma başarılı: ${purchaseDetails.productID}');
          await _completePurchase(purchaseDetails, _context!);
        } else if (purchaseDetails.status == PurchaseStatus.canceled) {
          changeLoading(false);
          notifyListeners();
          // Kullanıcı satın almada iptal etti.

          showTopSnackBar(
            Overlay.of(_context!),
            const CustomSnackBar.error(
              message: "Satın alma işlemi iptal edildi.",
            ),
          );
          print(
              'Satın alma iptal edildisdafafsf: ${purchaseDetails.productID}');
          await _completePurchase(purchaseDetails, _context!);
        }
      }
    });
  }

  ///--- sonradaqn eklenenler
  ///
}
