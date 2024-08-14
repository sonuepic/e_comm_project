class Product {
  final String name;
  final double price;
  final double discountPercentage;
  List<String>? images;
  int? weight;
  String? description;

  Product(
      {required this.name,
      required this.price,
      required this.discountPercentage,
      required this.images,
      required this.weight,
      required this.description});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['title'],
      price: json['price'].toDouble(),
      discountPercentage: json['discountPercentage'].toDouble(),
      images: json['images'].cast<String>(),
      weight: json['weight'],
      description: json['description'],
    );
  }
}
