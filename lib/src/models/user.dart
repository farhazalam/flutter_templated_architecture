class User {
  User(
      {this.id, this.name, this.phone, this.email, this.token, this.createdAt});

  int? id;
  String? name;
  String? phone;
  String? email;
  String? token;
  DateTime? createdAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        email: json["email"],
        token: json["token"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
      );
}
