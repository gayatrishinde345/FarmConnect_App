import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../business_logic/bloc/product_list_bloc.dart';
import '../business_logic/bloc/cart_bloc.dart';
import '../data/model/product_model.dart';

class ProductListPage extends StatelessWidget {
  const ProductListPage({super.key});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.products)),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              onChanged: (q) =>
                  context.read<ProductListBloc>().add(SearchProducts(q)),
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                hintText: l.searchHint,
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ProductListBloc, ProductListState>(
              builder: (context, state) {
                if (state is ProductListLoading ||
                    state is ProductListInitial) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is ProductListFailure) {
                  return Center(child: Text(l.networkError));
                }
                final products = (state as ProductListSuccess).products;
                if (products.isEmpty) return Center(child: Text(l.noProducts));
                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: products.length,
                  itemBuilder: (_, i) => _ProductCard(product: products[i]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ProductCard extends StatelessWidget {
  final ProductModel product;
  const _ProductCard({required this.product});
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFE8F5E9),
          child: Text(product.name.isEmpty ? '?' : product.name[0]),
        ),
        title: Text(product.name),
        subtitle: Text(
          '${product.category} • ₹${product.price.toStringAsFixed(0)} / ${product.unit}',
        ),
        trailing: IconButton(
          tooltip: l.addToCart,
          onPressed: () {
            context.read<CartBloc>().add(AddProduct(product));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(l.addToCart)));
          },
          icon: const Icon(Icons.add_shopping_cart),
        ),
      ),
    );
  }
}
