import 'dart:convert';

List<Sneaker> sneakerFromJson(String str) =>
    List<Sneaker>.from(json.decode(str).map((x) => Sneaker.fromJson(x)));

class Sneaker {
  final String id;
  final String name;
  final String title;
  final String description;
  final List<String> imageUrl;
  final String price;
  final String oldPrice;
  final String category;
  final List<dynamic> sizes;

  Sneaker({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.oldPrice,
    required this.category,
    required this.sizes,
  });

  factory Sneaker.fromJson(Map<String, dynamic> json) => Sneaker(
        id: json["_id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        price: json["price"],
        oldPrice: json["oldPrice"],
        category: json["category"],
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
      );
}
