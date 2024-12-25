class UserModel {
  String? name;
  String? email;
  String? phone;
  List<dynamic>? favorite;
  UserModel(
      { this.name,
       this.email,
       this.phone,
       this.favorite});
  factory UserModel.fromJson(json) {
    return UserModel(
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        favorite: json["favorite"]);
  }
  Map<String, dynamic> toJson() {
    return {"email": email, "phone": phone, "name": name, "favorite": []};
  }
}
