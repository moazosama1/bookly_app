/// amount : 11.99
/// currencyCode : "USD"

class RetailPrice {
  RetailPrice({
      this.amount, 
      this.currencyCode,});

  RetailPrice.fromJson(dynamic json) {
    amount = json['amount'];
    currencyCode = json['currencyCode'];
  }
  num? amount;
  String? currencyCode;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = amount;
    map['currencyCode'] = currencyCode;
    return map;
  }

}