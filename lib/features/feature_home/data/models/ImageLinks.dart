/// smallThumbnail : "http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=5&source=gbs_api"
/// thumbnail : "http://books.google.com/books/content?id=0RXLCgAAQBAJ&printsec=frontcover&img=1&zoom=1&source=gbs_api"

class ImageLinks {
  ImageLinks({
      this.smallThumbnail, 
      this.thumbnail,});

  ImageLinks.fromJson(dynamic json) {
    smallThumbnail = json['smallThumbnail'];
    thumbnail = json['thumbnail'];
  }
  String? smallThumbnail;
  String? thumbnail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['smallThumbnail'] = smallThumbnail;
    map['thumbnail'] = thumbnail;
    return map;
  }

}