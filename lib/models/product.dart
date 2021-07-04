class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final String unit;
  final double price;
  final double salePrice;
  final double rating;
  final int reviewCount;

  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.description,
      required this.unit,
      required this.price,
      required this.salePrice,
      required this.rating,
      required this.reviewCount});
}
