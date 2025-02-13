class Product {
  final int id;
  final String category;
  final String name;
  final String desc;
  final String info;
  final List<String> flavors;
  final String cover;
  final List<String> images;
  final double price;
  final double priceOffer;

  Product({
    required this.id,
    required this.category,
    required this.name,
    required this.desc,
    required this.info,
    required this.flavors,
    required this.cover,
    required this.images,
    required this.price,
    required this.priceOffer,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'],
        category: json['category'],
        name: json['name'],
        desc: json['desc'],
        info: json['info'],
        flavors: List<String>.from(json['flavors']),
        cover: json['cover'],
        images: List<String>.from(json['images']),
        price: double.parse(json['price'].toString()),
        priceOffer: double.parse(json['price_offer'].toString()),
      );
}
