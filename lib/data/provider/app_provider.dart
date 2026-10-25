import 'package:flutter_bloc/flutter_bloc.dart';
import '../../feature/product_module/business_logic/bloc/product_list_bloc.dart';
import '../../feature/product_module/business_logic/bloc/cart_bloc.dart';
import '../../feature/auth_module/business_logic/bloc/login_bloc.dart';

class AppProviders {
  static List<BlocProvider> get blocs => [
    BlocProvider(create: (_) => ProductListBloc()),
    BlocProvider(create: (_) => CartBloc()),
    BlocProvider(create: (_) => LoginBloc()),
  ];
}
