import 'IndustryIdentifiers.dart';
import 'ReadingModes.dart';
import 'PanelizationSummary.dart';
import 'ImageLinks.dart';

/// title : "Programming in C, 3e"
/// authors : ["Kamthane"]
/// publisher : "Pearson Education India"
/// publishedDate : "2015"
/// description : "C is one of the most popular programming languages. It runs on most software platforms and computer architecture. This revised edition of our best-selling text Programming in C not only maintains the exclusivity of previous editions but also enhances it with the addition of new programs and illustrations. Challenging concepts are supported with numerous solved and unsolved programs. The new chapter on computer graphics ensures that this book comprehensively covers the syllabi of most universities. The book also uses the Turbo C compiler, which is the most widely used C compiler. With its increased coverage and inclusion of new learning tools, this edition is an invaluable asset for students who aim to improve their programming skills."
/// industryIdentifiers : [{"type":"ISBN_13","identifier":"9789332547179"},{"type":"ISBN_10","identifier":"9332547173"}]
/// readingModes : {"text":false,"image":false}
/// pageCount : 689
/// printType : "BOOK"
/// categories : ["C (Computer program language)"]
/// maturityRating : "NOT_MATURE"
/// allowAnonLogging : true
/// contentVersion : "0.3.0.0.preview.0"
/// panelizationSummary : {"containsEpubBubbles":false,"containsImageBubbles":false}
/// imageLinks : {"smallThumbnail":"http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api","thumbnail":"http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"}
/// language : "en"
/// previewLink : "http://books.google.com.eg/books?id=0RXLCgAAQBAJ&dq=programming&hl=&cd=1&source=gbs_api"
/// infoLink : "http://books.google.com.eg/books?id=0RXLCgAAQBAJ&dq=programming&hl=&source=gbs_api"
/// canonicalVolumeLink : "https://books.google.com/books/about/Programming_in_C_3e.html?hl=&id=0RXLCgAAQBAJ"

class VolumeInfo {
  VolumeInfo({
      this.title, 
      this.authors, 
      this.publisher, 
      this.publishedDate, 
      this.description, 
      this.industryIdentifiers, 
      this.readingModes, 
      this.pageCount, 
      this.printType, 
      this.categories, 
      this.maturityRating, 
      this.allowAnonLogging, 
      this.contentVersion, 
      this.panelizationSummary, 
      this.imageLinks, 
      this.language, 
      this.previewLink, 
      this.infoLink, 
      this.canonicalVolumeLink,});

  VolumeInfo.fromJson(dynamic json) {
    title = json['title'];
    authors = json['authors'] != null ? json['authors'].cast<String>() : [];
    publisher = json['publisher'];
    publishedDate = json['publishedDate'];
    description = json['description'];
    if (json['industryIdentifiers'] != null) {
      industryIdentifiers = [];
      json['industryIdentifiers'].forEach((v) {
        industryIdentifiers?.add(IndustryIdentifiers.fromJson(v));
      });
    }
    readingModes = json['readingModes'] != null ? ReadingModes.fromJson(json['readingModes']) : null;
    pageCount = json['pageCount'];
    printType = json['printType'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    maturityRating = json['maturityRating'];
    allowAnonLogging = json['allowAnonLogging'];
    contentVersion = json['contentVersion'];
    panelizationSummary = json['panelizationSummary'] != null ? PanelizationSummary.fromJson(json['panelizationSummary']) : null;
    imageLinks = json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null;
    language = json['language'];
    previewLink = json['previewLink'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  ReadingModes? readingModes;
  num? pageCount;
  String? printType;
  List<String>? categories;
  String? maturityRating;
  bool? allowAnonLogging;
  String? contentVersion;
  PanelizationSummary? panelizationSummary;
  ImageLinks? imageLinks;
  String? language;
  String? previewLink;
  String? infoLink;
  String? canonicalVolumeLink;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['authors'] = authors;
    map['publisher'] = publisher;
    map['publishedDate'] = publishedDate;
    map['description'] = description;
    if (industryIdentifiers != null) {
      map['industryIdentifiers'] = industryIdentifiers?.map((v) => v.toJson()).toList();
    }
    if (readingModes != null) {
      map['readingModes'] = readingModes?.toJson();
    }
    map['pageCount'] = pageCount;
    map['printType'] = printType;
    map['categories'] = categories;
    map['maturityRating'] = maturityRating;
    map['allowAnonLogging'] = allowAnonLogging;
    map['contentVersion'] = contentVersion;
    if (panelizationSummary != null) {
      map['panelizationSummary'] = panelizationSummary?.toJson();
    }
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['previewLink'] = previewLink;
    map['infoLink'] = infoLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }

}