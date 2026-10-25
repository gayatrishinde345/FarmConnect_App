import 'package:flutter/material.dart';
import '../../feature/home_module/pages/home_page.dart';
import '../../feature/product_module/pages/product_list_page.dart';
import '../../feature/product_module/pages/cart_page.dart';
import '../../feature/profile_module/pages/profile_page.dart';

class NavigationUtils {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static Future<T?> push<T>(Widget page) =>
      navigatorKey.currentState!.push(MaterialPageRoute(builder: (_) => page));
}

class AppRoutes {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) =>
      switch (settings.name) {
        '/products' => MaterialPageRoute(
          builder: (_) => const ProductListPage(),
        ),
        '/cart' => MaterialPageRoute(builder: (_) => const CartPage()),
        '/profile' => MaterialPageRoute(builder: (_) => const ProfilePage()),
        _ => MaterialPageRoute(builder: (_) => const HomePage()),
      };
}
