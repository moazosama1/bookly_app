import 'IndustryIdentifiers.dart';
import 'Dimensions.dart';
import 'ImageLinks.dart';

/// title : "The Google story"
/// authors : ["David A. Vise","Mark Malseed"]
/// publisher : "Random House Digital, Inc."
/// publishedDate : "2005-11-15"
/// description : "\"Here is the story behind one of the most remarkable Internet\n  successes of our time. Based on scrupulous research and extraordinary access\n  to Google, ..."
/// industryIdentifiers : [{"type":"ISBN_10","identifier":"055380457X"},{"type":"ISBN_13","identifier":"9780553804577"}]
/// pageCount : 207
/// dimensions : {"height":"24.00 cm","width":"16.03 cm","thickness":"2.74 cm"}
/// printType : "BOOK"
/// mainCategory : "Business & Economics / Entrepreneurship"
/// categories : ["Browsers (Computer programs)","..."]
/// averageRating : 3.5
/// ratingsCount : 136
/// contentVersion : "1.1.0.0.preview.2"
/// imageLinks : {"smallThumbnail":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=5&edge=curl&source=gbs_api","thumbnail":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api","small":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=2&edge=curl&source=gbs_api","medium":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=3&edge=curl&source=gbs_api","large":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=4&edge=curl&source=gbs_api","extraLarge":"https://books.google.com/books?id=zyTCAlFPjgYC&printsec=frontcover&img=1&zoom=6&edge=curl&source=gbs_api"}
/// language : "en"
/// infoLink : "https://books.google.com/books?id=zyTCAlFPjgYC&ie=ISO-8859-1&source=gbs_api"
/// canonicalVolumeLink : "https://books.google.com/books/about/The_Google_story.html?id=zyTCAlFPjgYC"

class VolumeInfo {
  VolumeInfo({
      this.title, 
      this.authors, 
      this.publisher, 
      this.publishedDate, 
      this.description, 
      this.industryIdentifiers, 
      this.pageCount, 
      this.dimensions, 
      this.printType, 
      this.mainCategory, 
      this.categories, 
      this.averageRating, 
      this.ratingsCount, 
      this.contentVersion, 
      this.imageLinks, 
      this.language, 
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
    pageCount = json['pageCount'];
    dimensions = json['dimensions'] != null ? Dimensions.fromJson(json['dimensions']) : null;
    printType = json['printType'];
    mainCategory = json['mainCategory'];
    categories = json['categories'] != null ? json['categories'].cast<String>() : [];
    averageRating = json['averageRating'];
    ratingsCount = json['ratingsCount'];
    contentVersion = json['contentVersion'];
    imageLinks = json['imageLinks'] != null ? ImageLinks.fromJson(json['imageLinks']) : null;
    language = json['language'];
    infoLink = json['infoLink'];
    canonicalVolumeLink = json['canonicalVolumeLink'];
  }
  String? title;
  List<String>? authors;
  String? publisher;
  String? publishedDate;
  String? description;
  List<IndustryIdentifiers>? industryIdentifiers;
  num? pageCount;
  Dimensions? dimensions;
  String? printType;
  String? mainCategory;
  List<String>? categories;
  num? averageRating;
  num? ratingsCount;
  String? contentVersion;
  ImageLinks? imageLinks;
  String? language;
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
    map['pageCount'] = pageCount;
    if (dimensions != null) {
      map['dimensions'] = dimensions?.toJson();
    }
    map['printType'] = printType;
    map['mainCategory'] = mainCategory;
    map['categories'] = categories;
    map['averageRating'] = averageRating;
    map['ratingsCount'] = ratingsCount;
    map['contentVersion'] = contentVersion;
    if (imageLinks != null) {
      map['imageLinks'] = imageLinks?.toJson();
    }
    map['language'] = language;
    map['infoLink'] = infoLink;
    map['canonicalVolumeLink'] = canonicalVolumeLink;
    return map;
  }

}