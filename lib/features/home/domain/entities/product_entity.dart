abstract class ProductEntity{
  final String id;
  final String name;
  final String? description;
  final double price;
  final double discount;
  final String imageUrl;
  final String category;
  final String brand;
  final int stockQuantity;

  ProductEntity({required this.id, required this.name, required this.description, required this.price, required this.discount, required this.imageUrl, required this.category, required this.brand, required this.stockQuantity});
}