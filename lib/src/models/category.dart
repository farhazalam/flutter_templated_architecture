class Category {
  Category({this.id, this.name, this.image});

  int? id;
  String? name;
  String? image;
  // List<Product?>? products;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        // products: json["products"] == null
        //     ? null
        //     : List<Product>.from(
        //         json["products"].map((x) => Product.fromJson(x))).toList(),
      );
}
