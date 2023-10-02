import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hypotenuse/constants/ui_helper.dart';
import 'package:hypotenuse/model/plansProduct_model.dart';
import 'package:hypotenuse/purchase/purchases_provider.dart';
import 'package:hypotenuse/viewmodel/pricingPage_viewModel.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/billing_client_wrappers.dart';
import 'package:in_app_purchase_android/in_app_purchase_android.dart';
import 'package:in_app_purchase_storekit/in_app_purchase_storekit.dart';
import 'package:in_app_purchase_storekit/store_kit_wrappers.dart';
import 'package:provider/provider.dart';

import 'consumable_store.dart';

// Auto-consume must be true on iOS.
// To try without auto-consume on another platform, change `true` to `false` here.
final bool _kAutoConsume = Platform.isIOS || true;

const String _kConsumableId = 'consumable';
const String _kUpgradeId = 'upgrade';
const String _kMonthlySubscriptionId = 'copify_300cd_1m';
const String _kMonthlySubscriptionId2 = 'copifyer_700cd_1m';
const String _kMonthlySubscriptionId3 = 'copifyest_1100cd_1m';
const String _kAnnualSubscriptionId = 'copify_3600cd_1y';
const String _kAnnualSubscriptionId2 = 'copifyer_8400cd_1y';
const String _kAnnualSubscriptionId3 = 'copifyest_13200cd_1y';
const List<String> _kProductIds = <String>[
/*   _kConsumableId,
  _kUpgradeId, */
  _kMonthlySubscriptionId,
  _kMonthlySubscriptionId2,
  _kMonthlySubscriptionId3,
  _kAnnualSubscriptionId,
  _kAnnualSubscriptionId2,
  _kAnnualSubscriptionId3
  //_kGoldSubscriptionId,
];

class MainTest extends StatefulWidget {
  @override
  State<MainTest> createState() => MainTestState();
}

class MainTestState extends State<MainTest> {
  final InAppPurchase _inAppPurchase = InAppPurchase.instance;
  late StreamSubscription<List<PurchaseDetails>> _subscription;
  List<String> _notFoundIds = <String>[];
  List<ProductDetails> _products = <ProductDetails>[];
  List<PurchaseDetails> _purchases = <PurchaseDetails>[];
  List<String> _consumables = <String>[];
  bool _isAvailable = false;
  bool _purchasePending = false;
  bool _loading = true;
  String? _queryProductError;

  @override
  void initState() {
    final Stream<List<PurchaseDetails>> purchaseUpdated =
        _inAppPurchase.purchaseStream;
    _subscription =
        purchaseUpdated.listen((List<PurchaseDetails> purchaseDetailsList) {
      _listenToPurchaseUpdated(purchaseDetailsList);
    }, onDone: () {
      _subscription.cancel();
    }, onError: (Object error) {
      // handle error here.
    });
    initStoreInfo();
    super.initState();
  }

  Future<void> initStoreInfo() async {
    final bool isAvailable = await _inAppPurchase.isAvailable();
    if (!isAvailable) {
      setState(() {
        _isAvailable = isAvailable;
        _products = <ProductDetails>[];
        _purchases = <PurchaseDetails>[];
        _notFoundIds = <String>[];
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iosPlatformAddition.setDelegate(ExamplePaymentQueueDelegate());
    }

    final ProductDetailsResponse productDetailResponse =
        await _inAppPurchase.queryProductDetails(_kProductIds.toSet());
    if (productDetailResponse.error != null) {
      setState(() {
        _queryProductError = productDetailResponse.error!.message;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    if (productDetailResponse.productDetails.isEmpty) {
      setState(() {
        _queryProductError = null;
        _isAvailable = isAvailable;
        _products = productDetailResponse.productDetails;
        _purchases = <PurchaseDetails>[];
        _notFoundIds = productDetailResponse.notFoundIDs;
        _consumables = <String>[];
        _purchasePending = false;
        _loading = false;
      });
      return;
    }

    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _isAvailable = isAvailable;
      _products = productDetailResponse.productDetails;
      _notFoundIds = productDetailResponse.notFoundIDs;
      _consumables = consumables;
      _purchasePending = false;
      _loading = false;
    });
  }

  @override
  void dispose() {
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iosPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      iosPlatformAddition.setDelegate(null);
    }
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var viewmodel = Provider.of<PricingPageViewModel>(context);
    final purchaseProvider = Provider.of<PurchaseProvider>(context);
    final List<Widget> stack = <Widget>[];
    if (_queryProductError == null) {
      stack.add(
        ListView(
          children: <Widget>[
            //_buildConnectionCheckTile(),
            /* _buildProductList(purchaseProvider
                .plansProductModel.data!.product!.pricingPlans!), */
            //_buildConsumableBox(),
            //_buildRestoreButton(),
          ],
        ),
      );
    } else {
      stack.add(Center(
        child: Text(_queryProductError!),
      ));
    }
    if (_purchasePending) {
      stack.add(
        const Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.3,
              child: ModalBarrier(dismissible: false, color: Colors.grey),
            ),
            Center(
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      );
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('IAP Example'),
        ),
        body: FutureBuilder<PlansProductModel?>(
            future: purchaseProvider.planlariGetir(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return _buildProductList(purchaseProvider
                    .plansProductModel.data!.product!.pricingPlans!);
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }

  /*  Card _buildConnectionCheckTile() {
    if (_loading) {
      return const Card(child: ListTile(title: Text('Trying to connect...')));
    }
    final Widget storeHeader = ListTile(
      leading: Icon(_isAvailable ? Icons.check : Icons.block,
          color: _isAvailable
              ? Colors.green
              : ThemeData.light().colorScheme.error),
      title:
          Text('The store is ${_isAvailable ? 'available' : 'unavailable'}.'),
    );
    final List<Widget> children = <Widget>[storeHeader];

    if (!_isAvailable) {
      children.addAll(<Widget>[
        const Divider(),
        ListTile(
          title: Text('Not connected',
              style: TextStyle(color: ThemeData.light().colorScheme.error)),
          subtitle: const Text(
              'Unable to connect to the payments processor. Has this app been configured correctly? See the example README for instructions.'),
        ),
      ]);
    }
    return Card(child: Column(children: children));
  }
 */
  ListView _buildProductList(List<PricingPlans> products) {
    /*   if (_loading) {
      return const Card(
          child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Fetching products...')));
    }
    if (!_isAvailable) {
      return const Card();
    } */
    const ListTile productHeader = ListTile(title: Text('Products for Sale'));
    final List<Container> productList = <Container>[];
    if (_notFoundIds.isNotEmpty) {
      productList.add(
        Container(
          child: Text('[${_notFoundIds.join(", ")}] not found',
              style: TextStyle(color: ThemeData.light().colorScheme.error)),
        ),
      );
    }
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
              child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    SvgPicture.asset('assets/images/icons/growth.svg',
                        height: 30),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      products[index].name!,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.bold),
                    )
                  ]),
                  const Divider(
                    thickness: 2,
                  ),
                  const Text(
                      "Start exploring now and find out if it's the perfect fit for you."),
                  RichText(
                    text: TextSpan(
                      text: products[index].paymentInterval == 'YEARLY'
                          ? ('\$ ${(double.tryParse(products[index].price!) ?? 0) / 12}')
                          : products[index].price!.toString(),

                      // "price" değişkenini çevirip 12'ye böldük
                      style: const TextStyle(color: Colors.black, fontSize: 23),
                      children: const <TextSpan>[
                        TextSpan(
                          text: ' /month',
                          style: TextStyle(color: Colors.grey, fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  const Text('Standart', style: TextStyle(fontSize: 18)),
                  Text.rich(TextSpan(children: [
                    TextSpan(
                      text: '${products[index].credit}',
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    const TextSpan(
                      text: ' credits/year',
                    ),
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text: 'Write your articles with Article Writing Tools',
                    )
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text: 'Text to Image Generation',
                    )
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(text: 'Unlimited free AI images')
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text:
                          'Create CEO friendly advertisement for several platforms',
                    )
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text:
                          'Make your videos with guidance of Video Timeline Tool',
                    )
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text: 'Make your time consuming contents with ease',
                    )
                  ])),
                  const Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child:
                            Icon(Icons.check, color: Colors.indigo, size: 20)),
                    TextSpan(
                      text: 'Create your content in 11 LANGUAGES',
                    )
                  ])),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                      width: double.infinity,
                      child: Selector<PurchaseProvider, bool>(
                        builder: (context, isLoading, child) {
                          return ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: UIHelper.activeButtonColor(),
                            ),
                            onPressed: () async {},
                            child: isLoading
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text("Select"),
                          );
                        },
                        selector: (context, state) => state.isLoading,
                      ))
                ]),
          ));
        });
  }

/* 
  Card _buildConsumableBox() {
    if (_loading) {
      return const Card(
          child: ListTile(
              leading: CircularProgressIndicator(),
              title: Text('Fetching consumables...')));
    }
    if (!_isAvailable || _notFoundIds.contains(_kConsumableId)) {
      return const Card();
    }
    const ListTile consumableHeader =
        ListTile(title: Text('Purchased consumables'));
    final List<Widget> tokens = _consumables.map((String id) {
      return GridTile(
        child: IconButton(
          icon: const Icon(
            Icons.stars,
            size: 42.0,
            color: Colors.orange,
          ),
          splashColor: Colors.yellowAccent,
          onPressed: () => consume(id),
        ),
      );
    }).toList();
    return Card(
        child: Column(children: <Widget>[
      consumableHeader,
      const Divider(),
      GridView.count(
        crossAxisCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        children: tokens,
      )
    ]));
  }
 */
  Widget _buildRestoreButton() {
    if (_loading) {
      return Container();
    }

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
            onPressed: () => _inAppPurchase.restorePurchases(),
            child: const Text('Restore purchases'),
          ),
        ],
      ),
    );
  }

  Future<void> consume(String id) async {
    await ConsumableStore.consume(id);
    final List<String> consumables = await ConsumableStore.load();
    setState(() {
      _consumables = consumables;
    });
  }

  void showPendingUI() {
    setState(() {
      _purchasePending = true;
    });
  }

  Future<void> deliverProduct(PurchaseDetails purchaseDetails) async {
    // IMPORTANT!! Always verify purchase details before delivering the product.
    if (purchaseDetails.productID == _kConsumableId) {
      await ConsumableStore.save(purchaseDetails.purchaseID!);
      final List<String> consumables = await ConsumableStore.load();
      setState(() {
        _purchasePending = false;
        _consumables = consumables;
      });
    } else {
      setState(() {
        _purchases.add(purchaseDetails);
        _purchasePending = false;
      });
    }
  }

  void handleError(IAPError error) {
    setState(() {
      _purchasePending = false;
    });
  }

  Future<bool> _verifyPurchase(PurchaseDetails purchaseDetails) {
    // IMPORTANT!! Always verify a purchase before delivering the product.
    // For the purpose of an example, we directly return true.
    return Future<bool>.value(true);
  }

  void _handleInvalidPurchase(PurchaseDetails purchaseDetails) {
    // handle invalid purchase here if  _verifyPurchase` failed.
  }

  Future<void> _listenToPurchaseUpdated(
      List<PurchaseDetails> purchaseDetailsList) async {
    for (final PurchaseDetails purchaseDetails in purchaseDetailsList) {
      if (purchaseDetails.status == PurchaseStatus.pending) {
        showPendingUI();
      } else {
        if (purchaseDetails.status == PurchaseStatus.error) {
          handleError(purchaseDetails.error!);
        } else if (purchaseDetails.status == PurchaseStatus.purchased ||
            purchaseDetails.status == PurchaseStatus.restored) {
          final bool valid = await _verifyPurchase(purchaseDetails);
          if (valid) {
            unawaited(deliverProduct(purchaseDetails));
          } else {
            _handleInvalidPurchase(purchaseDetails);
            return;
          }
        }
        if (Platform.isAndroid) {
          if (!_kAutoConsume && purchaseDetails.productID == _kConsumableId) {
            final InAppPurchaseAndroidPlatformAddition androidAddition =
                _inAppPurchase.getPlatformAddition<
                    InAppPurchaseAndroidPlatformAddition>();
            await androidAddition.consumePurchase(purchaseDetails);
          }
        }
        if (purchaseDetails.pendingCompletePurchase) {
          await _inAppPurchase.completePurchase(purchaseDetails);
        }
      }
    }
  }

  Future<void> confirmPriceChange(BuildContext context) async {
    // Price changes for Android are not handled by the application, but are
    // instead handled by the Play Store. See
    // https://developer.android.com/google/play/billing/price-changes for more
    // information on price changes on Android.
    if (Platform.isIOS) {
      final InAppPurchaseStoreKitPlatformAddition iapStoreKitPlatformAddition =
          _inAppPurchase
              .getPlatformAddition<InAppPurchaseStoreKitPlatformAddition>();
      await iapStoreKitPlatformAddition.showPriceConsentIfNeeded();
    }
  }

  GooglePlayPurchaseDetails? _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    // This is just to demonstrate a subscription upgrade or downgrade.
    // This method assumes that you have only 2 subscriptions under a group, 'subscription_silver' & 'subscription_gold'.
    // The 'subscription_silver' subscription can be upgraded to 'subscription_gold' and
    // the 'subscription_gold' subscription can be downgraded to 'subscription_silver'.
    // Please remember to replace the logic of finding the old subscription Id as per your app.
    // The old subscription is only required on Android since Apple handles this internally
    // by using the subscription group feature in iTunesConnect.

    // ilk if içinde aylık 2. olan paket seçiliymiş 1. ye dönmüş.
    // else if içinde aylık 1. olan paket seçiliymiş 2. ye dönmüş.
    //burada ols subs dönüyor.
    // 3. olan if else kısmında ise 1. paket varmış 3. paket seçilmiş upgrade olmuş
    GooglePlayPurchaseDetails? oldSubscription;

    if (productDetails.id == _kMonthlySubscriptionId) {
      if (purchases[_kMonthlySubscriptionId2] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId2]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kMonthlySubscriptionId3] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId3]! as GooglePlayPurchaseDetails;
      }
    } else if (productDetails.id == _kMonthlySubscriptionId2) {
      if (purchases[_kMonthlySubscriptionId] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kMonthlySubscriptionId3] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId3]! as GooglePlayPurchaseDetails;
      }
    } else if (productDetails.id == _kMonthlySubscriptionId3) {
      if (purchases[_kMonthlySubscriptionId] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kMonthlySubscriptionId2] != null) {
        oldSubscription =
            purchases[_kMonthlySubscriptionId2]! as GooglePlayPurchaseDetails;
      }
    } else if (productDetails.id == _kAnnualSubscriptionId) {
      if (purchases[_kAnnualSubscriptionId2] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId2]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kAnnualSubscriptionId3] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId3]! as GooglePlayPurchaseDetails;
      }
    } else if (productDetails.id == _kAnnualSubscriptionId2) {
      if (purchases[_kAnnualSubscriptionId] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kAnnualSubscriptionId3] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId3]! as GooglePlayPurchaseDetails;
      }
    } else if (productDetails.id == _kAnnualSubscriptionId3) {
      if (purchases[_kAnnualSubscriptionId] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId]! as GooglePlayPurchaseDetails;
      } else if (purchases[_kAnnualSubscriptionId2] != null) {
        oldSubscription =
            purchases[_kAnnualSubscriptionId2]! as GooglePlayPurchaseDetails;
      }
    }

    return oldSubscription;
  }
}

/// Example implementation of the
/// [`SKPaymentQueueDelegate`](https://developer.apple.com/documentation/storekit/skpaymentqueuedelegate?language=objc).
///
/// The payment queue delegate can be implementated to provide information
/// needed to complete transactions.
class ExamplePaymentQueueDelegate implements SKPaymentQueueDelegateWrapper {
  @override
  bool shouldContinueTransaction(
      SKPaymentTransactionWrapper transaction, SKStorefrontWrapper storefront) {
    return true;
  }

  @override
  bool shouldShowPriceConsent() {
    return false;
  }
}
