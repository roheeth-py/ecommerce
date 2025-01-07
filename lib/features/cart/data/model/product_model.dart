import 'package:ecommerce/features/home/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final double price;
  @override
  final double discount;
  @override
  final String imageUrl;
  @override
  final String category;
  @override
  final String brand;
  @override
  final int stockQuantity;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.imageUrl,
    required this.category,
    required this.brand,
    required this.stockQuantity,
  }) : super(
          name: name,
          id: id,
          description: description,
          brand: brand,
          category: category,
          discount: discount,
          imageUrl: imageUrl,
          price: price,
          stockQuantity: stockQuantity,
        );

  factory ProductModel.fromDatabase(Map<String, dynamic> map) {
    return ProductModel(
        id: map["id"],
        name: map["name"],
        description: map["description"],
        price: map["price"],
        discount: map["discount"],
        imageUrl: map["imageUrl"],
        category: map["category"],
        brand: map["brand"],
        stockQuantity: map["stockQuantity"]);
  }

  Map<String, dynamic> toDatabase() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'discount': discount,
      'imageUrl': imageUrl,
      'category': category,
      'brand': brand,
      'stockQuantity': stockQuantity,
    };
  }
}
