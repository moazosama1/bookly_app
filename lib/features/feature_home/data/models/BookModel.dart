import 'VolumeInfo.dart';
import 'SaleInfo.dart';
import 'AccessInfo.dart';
import 'SearchInfo.dart';

/// kind : "books#volume"
/// id : "0RXLCgAAQBAJ"
/// etag : "XlHQgPh2BRo"
/// selfLink : "https://www.googleapis.com/books/v1/volumes/0RXLCgAAQBAJ"
/// volumeInfo : {"title":"Programming in C, 3e","authors":["Kamthane"],"publisher":"Pearson Education India","publishedDate":"2015","description":"C is one of the most popular programming languages. It runs on most software platforms and computer architecture. This revised edition of our best-selling text Programming in C not only maintains the exclusivity of previous editions but also enhances it with the addition of new programs and illustrations. Challenging concepts are supported with numerous solved and unsolved programs. The new chapter on computer graphics ensures that this book comprehensively covers the syllabi of most universities. The book also uses the Turbo C compiler, which is the most widely used C compiler. With its increased coverage and inclusion of new learning tools, this edition is an invaluable asset for students who aim to improve their programming skills.","industryIdentifiers":[{"type":"ISBN_13","identifier":"9789332547179"},{"type":"ISBN_10","identifier":"9332547173"}],"readingModes":{"text":false,"image":false},"pageCount":689,"printType":"BOOK","categories":["C (Computer program language)"],"maturityRating":"NOT_MATURE","allowAnonLogging":true,"contentVersion":"0.3.0.0.preview.0","panelizationSummary":{"containsEpubBubbles":false,"containsImageBubbles":false},"imageLinks":{"smallThumbnail":"http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"},"language":"en","previewLink":"http://books.google.com.eg/books?id=0RXLCgAAQBAJ&dq=programming&hl=&cd=1&source=gbs_api","infoLink":"http://books.google.com.eg/books?id=0RXLCgAAQBAJ&dq=programming&hl=&source=gbs_api","canonicalVolumeLink":"https://books.google.com/books/about/Programming_in_C_3e.html?hl=&id=0RXLCgAAQBAJ"}
/// saleInfo : {"country":"EG","saleability":"NOT_FOR_SALE","isEbook":false}
/// accessInfo : {"country":"EG","viewability":"NO_PAGES","embeddable":false,"publicDomain":false,"textToSpeechPermission":"ALLOWED","epub":{"isAvailable":false},"pdf":{"isAvailable":true},"webReaderLink":"http://play.google.com/books/reader?id=0RXLCgAAQBAJ&hl=&source=gbs_api","accessViewStatus":"NONE","quoteSharingAllowed":false}
/// searchInfo : {"textSnippet":"The new chapter on computer graphics ensures that this book comprehensively covers the syllabi of most universities. The book also uses the Turbo C compiler, which is the most widely used C compiler."}

class BookModel {
  BookModel({
    this.kind,
    this.id,
    this.etag,
    this.selfLink,
    this.volumeInfo,
    this.saleInfo,
    this.accessInfo,
    this.searchInfo,
  });

  BookModel.fromJson(dynamic json) {
    kind = json['kind'];
    id = json['id'];
    etag = json['etag'];
    selfLink = json['selfLink'];
    volumeInfo = json['volumeInfo'] != null
        ? VolumeInfo.fromJson(json['volumeInfo'])
        : null;
    saleInfo =
        json['saleInfo'] != null ? SaleInfo.fromJson(json['saleInfo']) : null;
    accessInfo = json['accessInfo'] != null
        ? AccessInfo.fromJson(json['accessInfo'])
        : null;
    searchInfo = json['searchInfo'] != null
        ? SearchInfo.fromJson(json['searchInfo'])
        : null;
  }
  String? kind;
  String? id;
  String? etag;
  String? selfLink;
  VolumeInfo? volumeInfo;
  SaleInfo? saleInfo;
  AccessInfo? accessInfo;
  SearchInfo? searchInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['kind'] = kind;
    map['id'] = id;
    map['etag'] = etag;
    map['selfLink'] = selfLink;
    if (volumeInfo != null) {
      map['volumeInfo'] = volumeInfo?.toJson();
    }
    if (saleInfo != null) {
      map['saleInfo'] = saleInfo?.toJson();
    }
    if (accessInfo != null) {
      map['accessInfo'] = accessInfo?.toJson();
    }
    if (searchInfo != null) {
      map['searchInfo'] = searchInfo?.toJson();
    }
    return map;
  }
}
