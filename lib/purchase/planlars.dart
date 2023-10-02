class Planlars {
  bool? result;
  Data? data;

  Planlars({
    this.result,
    this.data,
  });
}

class Data {
  Product? product;

  Data({
    this.product,
  });
}

class Product {
  int? id;
  String? name;
  String? description;
  String? projectId;
  dynamic creationDate;
  List<PricingPlan>? pricingPlans;

  Product({
    this.id,
    this.name,
    this.description,
    this.projectId,
    this.creationDate,
    this.pricingPlans,
  });
}

class PricingPlan {
  int? id;
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
}
