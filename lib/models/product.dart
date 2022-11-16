class Product {
  final String? id;
  final String title;
  final String description;
  final double price;
  final String img;
  Product({
    this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.img,
  });
  Product copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    String? img,
  }) {
    return Product(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'price': price,
      'img': img
    };
  }

  static Product fromJson(Map<String, dynamic> json) {
    return Product(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        price: json['price'],
        img: json['img']);
  }
}
