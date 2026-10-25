import '../../../../data/network/api_client.dart';
import '../../../../data/network/api_endpoints.dart';
import '../model/product_model.dart';

class ProductRepository {
  final ApiClient client;
  ProductRepository({ApiClient? client}) : client = client ?? ApiClient();
  Future<List<ProductModel>> fetchProducts() async {
    if (!client.isConfigured) return _localProducts;
    final response = await client.dio.get(ApiEndPoint.products);
    final rows =
        (response.data as Map<String, dynamic>)['data'] as List<dynamic>? ??
        const [];
    return rows
        .map((row) => ProductModel.fromJson(row as Map<String, dynamic>))
        .toList();
  }

  static const _localProducts = [
    ProductModel(
      id: 'tomato',
      name: 'Fresh tomatoes',
      category: 'Vegetables',
      unit: 'kg',
      price: 42,
      availableQuantity: 80,
    ),
    ProductModel(
      id: 'onion',
      name: 'Red onions',
      category: 'Vegetables',
      unit: 'kg',
      price: 36,
      availableQuantity: 120,
    ),
    ProductModel(
      id: 'wheat',
      name: 'Organic wheat',
      category: 'Grains',
      unit: 'kg',
      price: 58,
      availableQuantity: 250,
    ),
    ProductModel(
      id: 'mango',
      name: 'Alphonso mangoes',
      category: 'Fruits',
      unit: 'dozen',
      price: 480,
      availableQuantity: 30,
    ),
  ];
}
