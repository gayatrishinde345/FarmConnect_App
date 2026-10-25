class ProductModel {
  final String id, name, category, unit;
  final double price;
  final int availableQuantity;
  final String? imageUrl;
  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.unit,
    required this.price,
    required this.availableQuantity,
    this.imageUrl,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: '${json['id']}',
    name: json['name'] as String? ?? '',
    category: json['category'] as String? ?? '',
    unit: json['unit'] as String? ?? 'kg',
    price: (json['price'] as num?)?.toDouble() ?? 0,
    availableQuantity: (json['available_quantity'] as num?)?.toInt() ?? 0,
    imageUrl: json['image_url'] as String?,
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'category': category,
    'unit': unit,
    'price': price,
    'available_quantity': availableQuantity,
    'image_url': imageUrl,
  };
}
