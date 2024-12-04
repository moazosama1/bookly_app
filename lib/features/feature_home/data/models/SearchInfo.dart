/// textSnippet : "The new chapter on computer graphics ensures that this book comprehensively covers the syllabi of most universities. The book also uses the Turbo C compiler, which is the most widely used C compiler."

class SearchInfo {
  SearchInfo({
      this.textSnippet,});

  SearchInfo.fromJson(dynamic json) {
    textSnippet = json['textSnippet'];
  }
  String? textSnippet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['textSnippet'] = textSnippet;
    return map;
  }

}