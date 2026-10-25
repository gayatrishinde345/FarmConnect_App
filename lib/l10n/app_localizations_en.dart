// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'FarmConnect';

  @override
  String get home => 'Home';

  @override
  String get products => 'Fresh produce';

  @override
  String get orders => 'Orders';

  @override
  String get cart => 'Cart';

  @override
  String get profile => 'Profile';

  @override
  String get welcome => 'Fresh from farms, closer to you';

  @override
  String get browseProduce => 'Browse produce';

  @override
  String get categories => 'Categories';

  @override
  String get allProduce => 'All produce';

  @override
  String get searchHint => 'Search produce';

  @override
  String get noProducts => 'No produce found';

  @override
  String get tryAgain => 'Try again';

  @override
  String get addToCart => 'Add to cart';

  @override
  String get viewCart => 'View cart';

  @override
  String get quantity => 'Quantity';

  @override
  String get available => 'Available';

  @override
  String get placeOrder => 'Place order';

  @override
  String get emptyCart => 'Your cart is empty';

  @override
  String get emptyCartMessage => 'Add fresh produce to get started.';

  @override
  String get total => 'Total';

  @override
  String get login => 'Login';

  @override
  String get mobileNumber => 'Mobile number';

  @override
  String get continueLabel => 'Continue';

  @override
  String get language => 'Language';

  @override
  String get english => 'English';

  @override
  String get marathi => 'मराठी';

  @override
  String get hindi => 'हिन्दी';

  @override
  String get networkError =>
      'We could not connect. Showing available local data.';

  @override
  String get apiNotConfigured => 'Marketplace API is not configured yet.';

  @override
  String get profileComingSoon =>
      'Profile and role setup will be available when authentication is configured.';

  @override
  String get orderSuccess => 'Order placed successfully';

  @override
  String get farmer => 'Farmer';

  @override
  String get buyer => 'Buyer';

  @override
  String get supplier => 'Supplier';
}
