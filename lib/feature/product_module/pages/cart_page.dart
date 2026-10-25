import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../l10n/app_localizations.dart';
import '../business_logic/bloc/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l.cart)),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state.count == 0) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_basket_outlined, size: 60),
                  const SizedBox(height: 12),
                  Text(l.emptyCart),
                  Text(l.emptyCartMessage),
                ],
              ),
            );
          }
          return Column(
            children: [
              Expanded(
                child: ListView(
                  children: state.quantities.entries
                      .map(
                        (entry) => ListTile(
                          title: Text(state.products[entry.key]!.name),
                          subtitle: Text(
                            '${entry.value} × ₹${state.products[entry.key]!.price.toStringAsFixed(0)}',
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () => context.read<CartBloc>().add(
                              RemoveProduct(entry.key),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(l.total),
                        Text(
                          '₹${state.total.toStringAsFixed(0)}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton(
                        onPressed: () {
                          context.read<CartBloc>().add(const ClearCart());
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(l.orderSuccess)),
                          );
                        },
                        child: Text(l.placeOrder),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
