class EndPoints {
  static const baseUrl = 'http://10.0.2.2:3000/';

  static const login = 'login';
  static const getUser = 'getUser';
  static const getOrders = 'getOrders';
  static getOrdersWithId(id) => 'getOrders/$id';
}
