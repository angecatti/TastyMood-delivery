import '../models/cart_item.dart';

// For convenience when adding from HomeScreen
class CartItemQuick extends CartItem {
  CartItemQuick({required String name, required int price})
      : super(name: name, price: price);
}

class CartService {
  static final List<CartItem> _items = [];

  static List<CartItem> get items => _items;

  static void addItem(CartItem item) {
    _items.add(item);
  }

  static void removeItem(int index) {
    _items.removeAt(index);
  }

  static int get totalPrice {
    int total = 0;
    for (var item in _items) {
      total += item.price;
    }
    return total;
  }
}
