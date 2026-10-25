class ApiEndPoint {
  static const baseUrl = String.fromEnvironment(
    'FARMCONNECT_API_BASE_URL',
    defaultValue: '',
  );
  static const products = 'products';
  static const orders = 'orders';
  static const login = 'auth/login';
}
