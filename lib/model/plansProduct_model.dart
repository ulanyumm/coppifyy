class PlansProductModel {
  bool? result;
  Data? data;

  PlansProductModel({this.result, this.data});

  PlansProductModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Product? product;

  Data({this.product});

  Data.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  int? id;
  String? name;
  String? description;
  String? projectId;
  Null? creationDate;
  List<PricingPlans>? pricingPlans;

  Product(
      {this.id,
      this.name,
      this.description,
      this.projectId,
      this.creationDate,
      this.pricingPlans});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    projectId = json['project_id'];
    creationDate = json['creationDate'];
    if (json['pricingPlans'] != null) {
      pricingPlans = <PricingPlans>[];
      json['pricingPlans'].forEach((v) {
        pricingPlans!.add(new PricingPlans.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['project_id'] = this.projectId;
    data['creationDate'] = this.creationDate;
    if (this.pricingPlans != null) {
      data['pricingPlans'] = this.pricingPlans!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PricingPlans {
  int? id;
  String? name;
  String? description;
  Null? creationDate;
  String? price;
  String? currencyCode;
  String? status;
  Null? type;
  int? credit;
  String? paymentInterval;
  int? paymentIntervalCount;
  int? trialPeriodDays;
  int? recurrenceCount;

  PricingPlans(
      {this.id,
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
      this.recurrenceCount});

  PricingPlans.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    creationDate = json['creationDate'];
    price = json['price'];
    currencyCode = json['currencyCode'];
    status = json['status'];
    type = json['type'];
    credit = json['credit'];
    paymentInterval = json['paymentInterval'];
    paymentIntervalCount = json['paymentIntervalCount'];
    trialPeriodDays = json['trialPeriodDays'];
    recurrenceCount = json['recurrenceCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['creationDate'] = this.creationDate;
    data['price'] = this.price;
    data['currencyCode'] = this.currencyCode;
    data['status'] = this.status;
    data['type'] = this.type;
    data['credit'] = this.credit;
    data['paymentInterval'] = this.paymentInterval;
    data['paymentIntervalCount'] = this.paymentIntervalCount;
    data['trialPeriodDays'] = this.trialPeriodDays;
    data['recurrenceCount'] = this.recurrenceCount;
    return data;
  }
}
