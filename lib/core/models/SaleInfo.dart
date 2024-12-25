import 'package:bookly_app/core/models/ListPrice.dart';

import 'RetailPrice.dart';

/// country : "US"
/// saleability : "FOR_SALE"
/// isEbook : true
/// listPrice : {"amount":11.99,"currencyCode":"USD"}
/// retailPrice : {"amount":11.99,"currencyCode":"USD"}
/// buyLink : "https://books.google.com/books?id=zyTCAlFPjgYC&ie=ISO-8859-1&buy=&source=gbs_api"

class SaleInfo {
  SaleInfo({
      this.country, 
      this.saleability, 
      this.isEbook, 
      this.listPrice, 
      this.retailPrice, 
      this.buyLink,});

  SaleInfo.fromJson(dynamic json) {
    country = json['country'];
    saleability = json['saleability'];
    isEbook = json['isEbook'];
    listPrice = json['listPrice'];
    retailPrice = json['retailPrice'] != null ? RetailPrice.fromJson(json['retailPrice']) : null;
    buyLink = json['buyLink'];
  }
  String? country;
  String? saleability;
  bool? isEbook;
  ListPrice? listPrice;
  RetailPrice? retailPrice;
  String? buyLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country'] = country;
    map['saleability'] = saleability;
    map['isEbook'] = isEbook;
    map['listPrice'] = listPrice;
    if (retailPrice != null) {
      map['retailPrice'] = retailPrice?.toJson();
    }
    map['buyLink'] = buyLink;
    return map;
  }

}