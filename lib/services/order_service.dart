import '../models/order.dart';

class OrderService {
  static final List<Order> _orders = [];

  static List<Order> get orders => _orders;

  static void addOrder(Order order) {
    _orders.add(order);
  }
}
