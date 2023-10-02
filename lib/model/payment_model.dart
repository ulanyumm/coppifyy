import 'dart:convert';

PaymentPageModel paymentPageModelFromJson(String str) =>
    PaymentPageModel.fromJson(json.decode(str));

String paymentPageModelToJson(PaymentPageModel data) =>
    json.encode(data.toJson());

class PaymentPageModel {
  bool? result;
  PaymentPageModelData? data;
  String? name;
  String? surname;
  String? email;
  int? gsmNumber;
  int? pricingPlanId;
  String? cardHolderName;
  int? cardNumber;
  int? expireMonth;
  int? expireYear;
  int? cvc;
  String? billingContactName;
  String? billingCity;
  String? billingDistrict;
  String? billingCountry;
  String? billingAddress;
  String? billingZipCode;
  String? shippingContactName;
  String? shippingCity;
  String? shippingDistrict;
  String? shippingCountry;
  String? shippingAddress;
  String? shippingZipCode;

  PaymentPageModel({
    this.result,
    this.data,
    this.name,
    this.surname,
    this.email,
    this.gsmNumber,
    this.pricingPlanId,
    this.cardHolderName,
    this.cardNumber,
    this.expireMonth,
    this.expireYear,
    this.cvc,
    this.billingContactName,
    this.billingCity,
    this.billingDistrict,
    this.billingCountry,
    this.billingAddress,
    this.billingZipCode,
    this.shippingContactName,
    this.shippingCity,
    this.shippingDistrict,
    this.shippingCountry,
    this.shippingAddress,
    this.shippingZipCode,
  });

  factory PaymentPageModel.fromJson(Map<String, dynamic> json) =>
      PaymentPageModel(
        result: json["result"],
        data: json["data"] == null
            ? null
            : PaymentPageModelData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "name": name,
        "surname": surname,
        "email": email,
        "gsm_number": gsmNumber,
        "pricing_plan_id": pricingPlanId,
        "card_holder_name": cardHolderName,
        "card_number": cardNumber,
        "expire_month": expireMonth,
        "expire_year": expireYear,
        "cvc": cvc,
        "billing_contact_name": billingContactName,
        "billing_city": billingCity,
        "billing_district": billingDistrict,
        "billing_country": billingCountry,
        "billing_address": billingAddress,
        "billing_zip_code": billingZipCode,
        "shipping_contact_name": shippingContactName,
        "shipping_city": shippingCity,
        "shipping_district": shippingDistrict,
        "shipping_country": shippingCountry,
        "shipping_address": shippingAddress,
        "shipping_zip_code": shippingZipCode,
        "data": data?.toJson(),
      };
}

class PaymentPageModelData {
  PurpleSubscription? subscription;
  int? totalCredits;

  PaymentPageModelData({
    this.subscription,
    this.totalCredits,
  });

  factory PaymentPageModelData.fromJson(Map<String, dynamic> json) =>
      PaymentPageModelData(
        subscription: json["subscription"] == null
            ? null
            : PurpleSubscription.fromJson(json["subscription"]),
        totalCredits: json["total_credits"],
      );

  Map<String, dynamic> toJson() => {
        "subscription": subscription?.toJson(),
        "total_credits": totalCredits,
      };
}

class PurpleSubscription {
  Headers? headers;
  Original? original;
  dynamic exception;

  PurpleSubscription({
    this.headers,
    this.original,
    this.exception,
  });

  factory PurpleSubscription.fromJson(Map<String, dynamic> json) =>
      PurpleSubscription(
        headers:
            json["headers"] == null ? null : Headers.fromJson(json["headers"]),
        original: json["original"] == null
            ? null
            : Original.fromJson(json["original"]),
        exception: json["exception"],
      );

  Map<String, dynamic> toJson() => {
        "headers": headers?.toJson(),
        "original": original?.toJson(),
        "exception": exception,
      };
}

class Headers {
  Headers();

  factory Headers.fromJson(Map<String, dynamic> json) => Headers();

  Map<String, dynamic> toJson() => {};
}

class Original {
  bool? result;
  String? message;
  OriginalData? data;

  Original({
    this.result,
    this.message,
    this.data,
  });

  factory Original.fromJson(Map<String, dynamic> json) => Original(
        result: json["result"],
        message: json["message"],
        data: json["data"] == null ? null : OriginalData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "result": result,
        "message": message,
        "data": data?.toJson(),
      };
}

class OriginalData {
  FluffySubscription? subscription;

  OriginalData({
    this.subscription,
  });

  factory OriginalData.fromJson(Map<String, dynamic> json) => OriginalData(
        subscription: json["subscription"] == null
            ? null
            : FluffySubscription.fromJson(json["subscription"]),
      );

  Map<String, dynamic> toJson() => {
        "subscription": subscription?.toJson(),
      };
}

class FluffySubscription {
  int? id;
  String? status;
  PricingPlan? pricingPlan;
  Customer? customer;
  int? startingDate;
  int? endingDate;

  FluffySubscription({
    this.id,
    this.status,
    this.pricingPlan,
    this.customer,
    this.startingDate,
    this.endingDate,
  });

  factory FluffySubscription.fromJson(Map<String, dynamic> json) =>
      FluffySubscription(
        id: json["id"],
        status: json["status"],
        pricingPlan: json["pricingPlan"] == null
            ? null
            : PricingPlan.fromJson(json["pricingPlan"]),
        customer: json["customer"] == null
            ? null
            : Customer.fromJson(json["customer"]),
        startingDate: json["startingDate"],
        endingDate: json["endingDate"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "pricingPlan": pricingPlan?.toJson(),
        "customer": customer?.toJson(),
        "startingDate": startingDate,
        "endingDate": endingDate,
      };
}

class Customer {
  int? id;
  int? productId;
  String? name;
  String? email;
  String? gsmNumber;
  dynamic creationDate;
  IngAddress? shippingAddress;
  IngAddress? billingAddress;

  Customer({
    this.id,
    this.productId,
    this.name,
    this.email,
    this.gsmNumber,
    this.creationDate,
    this.shippingAddress,
    this.billingAddress,
  });

  factory Customer.fromJson(Map<String, dynamic> json) => Customer(
        id: json["id"],
        productId: json["productId"],
        name: json["name"],
        email: json["email"],
        gsmNumber: json["gsmNumber"],
        creationDate: json["creationDate"],
        shippingAddress: json["shippingAddress"] == null
            ? null
            : IngAddress.fromJson(json["shippingAddress"]),
        billingAddress: json["billingAddress"] == null
            ? null
            : IngAddress.fromJson(json["billingAddress"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "productId": productId,
        "name": name,
        "email": email,
        "gsmNumber": gsmNumber,
        "creationDate": creationDate,
        "shippingAddress": shippingAddress?.toJson(),
        "billingAddress": billingAddress?.toJson(),
      };
}

class IngAddress {
  String? contactName;
  String? city;
  String? district;
  String? country;
  String? address;
  String? zipCode;

  IngAddress({
    this.contactName,
    this.city,
    this.district,
    this.country,
    this.address,
    this.zipCode,
  });

  factory IngAddress.fromJson(Map<String, dynamic> json) => IngAddress(
        contactName: json["contactName"],
        city: json["city"],
        district: json["district"],
        country: json["country"],
        address: json["address"],
        zipCode: json["zipCode"],
      );

  Map<String, dynamic> toJson() => {
        "contactName": contactName,
        "city": city,
        "district": district,
        "country": country,
        "address": address,
        "zipCode": zipCode,
      };
}

class PricingPlan {
  int? id;
  Product? product;
  String? name;
  String? description;
  dynamic creationDate;
  String? price;
  String? currencyCode;
  String? status;
  dynamic type;
  int? credit;
  String? paymentInterval;
  int? paymentIntervalCount;
  int? trialPeriodDays;
  int? recurrenceCount;

  PricingPlan({
    this.id,
    this.product,
    this.name,
    this.description,
    this.creationDate,
    this.price,
    this.currencyCode,
    this.status,
    this.type,
    this.credit,
    this.paymentInterval,
    this.paymentIntervalCount,
    this.trialPeriodDays,
    this.recurrenceCount,
  });

  factory PricingPlan.fromJson(Map<String, dynamic> json) => PricingPlan(
        id: json["id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        name: json["name"],
        description: json["description"],
        creationDate: json["creationDate"],
        price: json["price"],
        currencyCode: json["currencyCode"],
        status: json["status"],
        type: json["type"],
        credit: json["credit"],
        paymentInterval: json["paymentInterval"],
        paymentIntervalCount: json["paymentIntervalCount"],
        trialPeriodDays: json["trialPeriodDays"],
        recurrenceCount: json["recurrenceCount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "product": product?.toJson(),
        "name": name,
        "description": description,
        "creationDate": creationDate,
        "price": price,
        "currencyCode": currencyCode,
        "status": status,
        "type": type,
        "credit": credit,
        "paymentInterval": paymentInterval,
        "paymentIntervalCount": paymentIntervalCount,
        "trialPeriodDays": trialPeriodDays,
        "recurrenceCount": recurrenceCount,
      };
}

class Product {
  int? id;
  String? name;
  String? description;
  dynamic creationDate;
  dynamic token;

  Product({
    this.id,
    this.name,
    this.description,
    this.creationDate,
    this.token,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        creationDate: json["creationDate"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "creationDate": creationDate,
        "token": token,
      };
}
