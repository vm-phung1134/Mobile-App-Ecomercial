class Cart {
  final String id;
  final String title;
  final int quantity;
  final double price;
  final String image;
  Cart(
      {required this.id,
      required this.title,
      required this.quantity,
      required this.price,
      required this.image});
  Cart copyWith({
    String? id,
    String? title,
    int? quantity,
    double? price,
    String? image,
  }) {
    return Cart(
        id: id ?? this.id,
        title: title ?? this.title,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        image: image ?? this.image);
  }
}
